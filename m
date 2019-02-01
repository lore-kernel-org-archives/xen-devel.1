From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/svm: Fix handling of ICEBP
 intercepts
Date: Fri, 01 Feb 2019 08:58:25 -0700
Message-ID: <5C546CA1020000780021335F@prv1-mh.provo.novell.com>
References: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE5IGF0IDE1OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gYy9zIDkzMzhhMzdkICJ4ODYvc3ZtOiBpbXBsZW1lbnQgZGVidWcgZXZlbnRzIiBhZGRl
ZCBzdXBwb3J0IGZvciBpbnRyb3NwZWN0aW5nCj4gSUNFQlAgZGVidWcgZXhjZXB0aW9ucywgYnV0
IGRpZG4ndCBhY2NvdW50IGZvciB0aGUgZmFjdCB0aGF0Cj4gc3ZtX2dldF9pbnNuX2xlbigpIChw
cmV2aW91c2x5IF9fZ2V0X2luc3RydWN0aW9uX2xlbmd0aCkgY2FuIGZhaWwgYW5kIG1heQo+IGFs
cmVhZHkgcmFpc2UgI0dQIGZvciB0aGUgZ3Vlc3QuCj4gCj4gSWYgc3ZtX2dldF9pbnNuX2xlbigp
IGZhaWxzLCByZXR1cm4gYmFjayB0byBndWVzdCBjb250ZXh0IHJhdGhlciB0aGFuCj4gY29udGlu
dWluZyBhbmQgbWlzdGFraW5nIGEgdHJhcC1zdHlsZSBWTUV4aXQgZm9yIGEgZmF1bHQtc3R5bGUg
b25lLgoKTXkgcmVhZGluZyBvZiB0aGUgbGFzdCBwYXJ0IG9mIHRoaXMgc2VudGVuY2UgaXMgdGhh
dCB0aGUgZXhpdCBpbgpxdWVzdGlvbiBpcyBhIHRyYXAtc3R5bGUgb25lLiBJcyBteSBFbmdsaXNo
IGZhaWxpbmcgbWUgaGVyZT8KQmVjYXVzZSBpZiBzbywgd2h5IHdvdWxkIHRoZXJlIGJlIGFueSBj
YWxsIHRvIHN2bV9nZXRfaW5zbl9sZW4oKQppbiB0aGUgZmlyc3QgcGxhY2U/IEZvciBhIHRyYXAt
c3R5bGUgZXhpdCBndWVzdCBSSVAgc2hvdWxkIGFscmVhZHkKcG9pbnQgcGFzdCB0aGUgaW5zbiwg
YW5kIGhlbmNlIHRoZSBkZWJ1ZyBtb2RlIGNoZWNraW5nIG91Z2h0CnRvIG5ldmVyIHN1Y2NlZWQg
KHVubGVzcyB0aGVyZSdzIGEgc2Vjb25kIElDRUJQIGZvbGxvd2luZyB0aGUKZmlyc3Qgb25lIGlt
bWVkaWF0ZWx5KS4KCklmLCBvdG9oLCBpdCByZWFsbHkgaXMgYSBmYXVsdC1zdHlsZSBleGl0ICh3
aGljaCB3YXMgbXkgdW5kZXJzdGFuZGluZwpzbyBmYXIpLCBob3cgaXMgZXhpdGluZyBiYWNrIHRv
IGd1ZXN0IGNvbnRleHQgZ29pbmcgdG8gZG8gYW55Cmdvb2QsIGlmIHN2bV9nZXRfaW5zbl9sZW4o
KSBkaWQgX25vdF8gcmFpc2UgI0dQKDApPyBXZSdkIGp1c3QKc2VlIHRoZSBzYW1lIGV4aXQgcmln
aHQgYXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
