From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12] x86/svm: Fix handling of ICEBP
 intercepts
Date: Fri, 1 Feb 2019 16:25:24 +0000
Message-ID: <da8c1a3c-353c-93ad-8637-17d1031ccec9@citrix.com>
References: <1549032559-9076-1-git-send-email-andrew.cooper3@citrix.com>
 <5C546CA1020000780021335F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C546CA1020000780021335F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDIuMTkg
YXQgMTU6NDksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gYy9zIDkzMzhh
MzdkICJ4ODYvc3ZtOiBpbXBsZW1lbnQgZGVidWcgZXZlbnRzIiBhZGRlZCBzdXBwb3J0IGZvciBp
bnRyb3NwZWN0aW5nCj4+IElDRUJQIGRlYnVnIGV4Y2VwdGlvbnMsIGJ1dCBkaWRuJ3QgYWNjb3Vu
dCBmb3IgdGhlIGZhY3QgdGhhdAo+PiBzdm1fZ2V0X2luc25fbGVuKCkgKHByZXZpb3VzbHkgX19n
ZXRfaW5zdHJ1Y3Rpb25fbGVuZ3RoKSBjYW4gZmFpbCBhbmQgbWF5Cj4+IGFscmVhZHkgcmFpc2Ug
I0dQIGZvciB0aGUgZ3Vlc3QuCj4+Cj4+IElmIHN2bV9nZXRfaW5zbl9sZW4oKSBmYWlscywgcmV0
dXJuIGJhY2sgdG8gZ3Vlc3QgY29udGV4dCByYXRoZXIgdGhhbgo+PiBjb250aW51aW5nIGFuZCBt
aXN0YWtpbmcgYSB0cmFwLXN0eWxlIFZNRXhpdCBmb3IgYSBmYXVsdC1zdHlsZSBvbmUuCj4gTXkg
cmVhZGluZyBvZiB0aGUgbGFzdCBwYXJ0IG9mIHRoaXMgc2VudGVuY2UgaXMgdGhhdCB0aGUgZXhp
dCBpbgo+IHF1ZXN0aW9uIGlzIGEgdHJhcC1zdHlsZSBvbmUuIElzIG15IEVuZ2xpc2ggZmFpbGlu
ZyBtZSBoZXJlPwoKWW91ciByZWFkaW5nIG9mIG15IHNlbnRlbmNlIGlzIGNvcnJlY3QsIGJ1dCBJ
IHdhcyBjb25mdXNlZCB3aGVuIHdyaXRpbmcgaXQuCgpJQ0VCUCBpcyBhIGZhdWx0LXN0eWxlIGlu
dGVyY2VwdC4KCkhvd2V2ZXIsIHdoZW4gc3ZtX2dldF9pbnNuX2xlbigpIGZhaWxzLCBpdCB3aWxs
IGluamVjdCAjR1AgYW5kIHJldHVybgowLsKgIFRoaXMgdGhlbiBnZXRzIHBhc3NlZCBpbnRvIGh2
bV9tb25pdG9yX2RlYnVnKCkgb3IgdGhlICNEQgpyZS1pbmplY3RlZCBhcy13YXMuCgpJZiBpdCB3
ZXJlIGp1c3QgZ2V0dGluZyBpbnNuX2xlbiBpbmNvcnJlY3RseSBhcyAwLCB0aGVuIHRoZSBndWVz
dCB3b3VsZApsaXZlbG9jayBhcyB3ZSB3b3VsZG4ndCBpbmplY3QgdGhlICNEQiB3aXRoIHRyYXAg
c2VtYW50aWNzIGl0IHJlcXVpcmVzLApidXQgYXMgdGhlICNHUCBpcyBhbHJlYWR5IHJhaXNlZCwg
dGhpcyB3aWxsIGNvbWJpbmUgdG8gI0RGLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
