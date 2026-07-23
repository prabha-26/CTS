import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators
} from '@angular/forms';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './home.html',
  styleUrl: './home.css'
})
export class Home {

  enrollmentForm: FormGroup;

  constructor(private fb: FormBuilder) {

    this.enrollmentForm = this.fb.group({

      studentName: ['', Validators.required],

      email: ['', [
        Validators.required,
        Validators.email
      ]],

      course: ['', Validators.required]

    });

  }

  submitForm() {
  console.log("Submit button clicked");

  if (this.enrollmentForm.valid) {
    alert("Enrollment Successful!");
    console.log(this.enrollmentForm.value);
    this.enrollmentForm.reset();
  }
}

}