From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [VMI] Possible race-condition in altp2m APIs
Date: Fri, 10 May 2019 11:55:43 +0100
Message-ID: <e05b6e4e-4e28-719d-8950-6fcb3e5159e7@citrix.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <CABfawh=_Xg225Tfw-zS9iXXk2pdUG0MyBi3+Co5Urmh6EfTOXw@mail.gmail.com>
 <a8f1adea-9d57-5953-614f-85f7b97be44f@citrix.com>
 <6a1009e7d820c8ef66c0923a2b74d97cb4f8397f.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP3Bs-0007Wu-3P
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 10:55:48 +0000
In-Reply-To: <6a1009e7d820c8ef66c0923a2b74d97cb4f8397f.camel@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Mathieu Tarral <mathieu.tarral@protonmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxMTo1MiwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToKPiBPbiBU
aHUsIDIwMTktMDUtMDkgYXQgMTk6MDAgKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9u
IDA5LzA1LzIwMTkgMTg6NDYsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4gSSBoYXZlIHNvbWUg
cGxhbnMgdG8gcmVwbGFjZSBpdCB3aXRoIHNvbWV0aGluZyBmYXIgbW9yZSB1c2FibGUsIGFzCj4+
IHBhcnQKPj4gb2YgdHlpbmcgdG9nZXRoZXIgc29tZSBYVEYtYmFzZWQgVk1JIHRlc3RpbmcsIGJ1
dCBub25lIG9mIHRoYXQgaXMKPj4gcmVtb3RlbHkgcmVhZHkgeWV0Lgo+IEhpIEFuZHJldywKPgo+
IERpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIGxvb2sgYXQgdGhpcyBzZXJpZXM/IAo+IGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMi9tc2cw
MjQyMS5odG1sCj4KPiBJZiBpdCBkb2Vucyd0IG1hdGNoIHlvdXIgcmVxdWlyZW1lbnRzLCBJIGNh
biBtb2RpZnkgaXQgYWNjb3JkaW5nbHkuCgpJIGhhdmUsIGFuZCB3aGlsZSBJIGhhdmVuJ3QgaGFk
IHRpbWUgdG8gYWN0IG9uIGFueSBvZiBpdCB5ZXQsIEkgYW0KcGxhbm5pbmcgdG8gdXNlIHNvbWUg
b2YgaXQsIGJ1dCBJIHRoaW5rIEkndmUgZ290IGEgY2xldmVyIGlkZWEgdG8gbWFrZQp0aGUgZG9t
MCBzaWRlIHJhdGhlciBjbGVhbmVyIHRvIHVzZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
