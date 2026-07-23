import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-student-profile',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './student-profile.html',
  styleUrl: './student-profile.css'
})
export class StudentProfile {

  @Input() studentName = 'Rishik Sai';

  course = 'Artificial Intelligence and Machine Learning';

  college = 'VFSTR';

  fees = 50000;

  joiningDate = new Date();

  attendance = 0.92;

  cgpa = 8.7563;

}