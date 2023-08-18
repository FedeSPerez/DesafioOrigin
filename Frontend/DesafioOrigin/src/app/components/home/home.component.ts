import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  cardNumber: string = '';
  maskedCardNumber: string = '';

  digitButtons: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  constructor() {
    
  }

  digitButtonClicked(digit: string) {
    this.cardNumber += digit;
    this.updateCardNumber();
  }

  acceptButtonClicked() {
     
  }

  clearButtonClicked() {

    this.cardNumber = '';
    this.updateCardNumber();
  }

  private updateCardNumber() {
    const chunks = [];
    for (let i = 0; i < this.cardNumber.length; i += 4) {
      chunks.push(this.cardNumber.slice(i, i + 4));
    }
    this.maskedCardNumber = chunks.join('-'); 
  }
}