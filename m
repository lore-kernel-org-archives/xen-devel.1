From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 2/4] hvm/svm: Enable Breakpoint events
Date: Mon, 12 Feb 2018 09:03:30 -0700
Message-ID: <CABfawh=V=p9u5Ho-G6o9eQnkx6Y2e9SEwUnO0AD7Woyo-2r_QQ@mail.gmail.com>
References: <1518448098-6493-1-git-send-email-aisaila@bitdefender.com>
 <1518448098-6493-3-git-send-email-aisaila@bitdefender.com>
 <5aba8de5-4cca-9a4b-0f82-ec032eb48b96@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5aba8de5-4cca-9a4b-0f82-ec032eb48b96@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTIsIDIwMTggYXQgODo1NCBBTSwgQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gT24gMTIvMDIvMTggMTU6MDgsIEFsZXhhbmRydSBJ
c2FpbGEgd3JvdGU6Cj4+IEBAIC0yNjE5LDE0ICsyNjM0LDMxIEBAIHZvaWQgc3ZtX3ZtZXhpdF9o
YW5kbGVyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiAgICAgICAgICBicmVhazsKPj4K
Pj4gICAgICBjYXNlIFZNRVhJVF9FWENFUFRJT05fQlA6Cj4+IC0gICAgICAgIGlmICggIXYtPmRv
bWFpbi0+ZGVidWdnZXJfYXR0YWNoZWQgKQo+PiAtICAgICAgICAgICAgZ290byB1bmV4cGVjdGVk
X2V4aXRfdHlwZTsKPj4gLSAgICAgICAgLyogQU1EIFZvbDIsIDE1LjExOiBJTlQzLCBJTlRPLCBC
T1VORCBpbnRlcmNlcHRzIGRvIG5vdCB1cGRhdGUgUklQLiAqLwo+PiAtICAgICAgICBpZiAoIChp
bnN0X2xlbiA9IF9fZ2V0X2luc3RydWN0aW9uX2xlbmd0aCh2LCBJTlNUUl9JTlQzKSkgPT0gMCAp
Cj4+ICsgICAgICAgIGluc3RfbGVuID0gX19nZXRfaW5zdHJ1Y3Rpb25fbGVuZ3RoKHYsIElOU1RS
X0lOVDMpOwo+Cj4gVGhlcmUgYXJlIG11bHRpcGxlIHdheXMgb2YgZW5kaW5nIHVwIHdpdGggdGhp
cyB2bWV4aXQsIGFuZCBJTlQzIGlzIG5vdAo+IHRoZSBvbmx5IHdheS4KPgo+IFRoZSBvbGQgY29k
ZSB3YXMgc29tZXdoYXQgYnJva2VuIChidXQgb25seSBpbiB0aGUgY2FzZSB0aGF0IGEgZGVidWdn
ZXIKPiB3YXMgYXR0YWNoZWQpLCBidXQgbm93IHdpdGggIHRoaXMgaW50cm9zcGVjdGlvbiBob29r
IGFjdGl2ZSwgZXhlY3V0aW5nCj4gYDB4Y2QgMHgwM2Agd2lsbCBlbmQgdXAgY3Jhc2hpbmcgdGhl
IGRvbWFpbiBiZWNhdXNlIG9mIGEgbGVuZ3RoIG1pc21hdGNoCj4gbG9va2luZyBmb3IgMHhjYy4K
Pgo+IFlvdSBuZWVkIHRvIGluc3BlY3QgRVhJVElOVElORk8gdG8gd29yayBvdXQgd2hhdCB3ZW50
IG9uIGhlcmUsIGFuZAo+IGRpc3Rpbmd1aXNoIElOVDMgZnJvbSBJTlQgJDMuCj4KPiBDYW4gSSBz
dWdnZXN0IHRoYXQgeW91IHJ1biB0aGlzIHVuaXQgdGVzdAo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZG9jcy94dGYvdGVzdC1zd2ludC1lbXVsYXRpb24uaHRtbCB1bmRlciBkZWJ1Zwo+IGludHJv
c3BlY3Rpb24gYW4gY2hlY2sgdGhhdCB5b3UgZ2V0IGFsbCBleHBlY3RlZCBldmVudHM/ICBFdmVy
eSB0aW1lIHdlCj4gdG91Y2ggdGhpcyBjb2RlLCB3ZSBzZWVtIHRvIGJyZWFrIGl0IDooCj4KCisx
LCB0aGlzIHVzZWQgdG8gYmUgYW4gaXNzdWUgdW5kZXIgdm14IGFzIHdlbGwKClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
