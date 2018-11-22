From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 06/14] x86/hvm: Make the altp2m locking
 easier to follow
Date: Thu, 22 Nov 2018 08:08:26 -0700
Message-ID: <5BF6C66A02000078001FEFE5@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-7-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRHJvcCB0aGUgYXAybV9hY3RpdmUgYm9vbGVhbiwgYW5kIGNvbnNpc3RlbnRseSB1c2Ug
dGhlIHVubG9ja2luZyBmb3JtOgo+IAo+ICAgaWYgKCBwMm0gIT0gaG9zdHAybSApCj4gICAgICAg
IF9fcHV0X2dmbihwMm0sIGdmbik7Cj4gICBfX3B1dF9nZm4oaG9zdHAybSwgZ2ZuKTsKPiAKPiB3
aGljaCBtYWtlcyBpdCBjbGVhciB0aGF0IHdlIGFsd2F5cyB1bmxvY2sgdGhlIGFsdHAybSdzIGdm
biBpZiBpdCBpcyBpbiB1c2UsCj4gYW5kIGFsd2F5cyB1bmxvY2sgdGhlIGhvc3RwMm0ncyBnZm4u
ICBUaGlzIGFsc28gZHJvcHMgdGhlIHRlcm5hcnkgZXhwcmVzc2lvbgo+IGluIHRoZSBsb2dkaXJ0
eSBjYXNlLgo+IAo+IEV4dGVuZCB0aGUgbG9nZGlydHkgY29tbWVudCB0byBpZGVudGlmeSB3aGVy
ZSB0aGUgbG9ja2luZyB2aW9sYXRpb24gaXMgbGlhYmxlCj4gdG8gb2NjdXIuCj4gCj4gTm8gKGlu
dGVuZGVkKSBvdmVyYWxsIGNoYW5nZSBpbiBiZWhhdmlvdXIuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmFsYmVpdCBJIHRoaW5rIHRoZSB0aXRsZSBj
b3VsZCBkbyB3aXRoIHNvbWUgaW1wcm92ZW1lbnQ6IEFzIGl0IHN0YW5kcwppdCByZWFkcyBhcyBp
ZiB5b3UgZG8gYW4gYWx0cDJtLWdsb2JhbCBjaGFuZ2UsIGJ1dCBpdCdzIGFsbCBsaW1pdGVkIHRv
Cmh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQoKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
