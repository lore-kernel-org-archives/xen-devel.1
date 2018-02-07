From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/nmi: lower initial watchdog frequency
 to avoid boot hangs
Date: Wed, 07 Feb 2018 06:08:46 -0700
Message-ID: <5A7B086E02000078001A6095@prv-mh.provo.novell.com>
References: <1517865522-3248-1-git-send-email-igor.druzhinin@citrix.com>
 <5A79E0CB02000078001A5BBA@prv-mh.provo.novell.com>
 <990db14d-4ee2-bf95-20b4-1a050fc8fc9e@citrix.com>
 <5A79E49A02000078001A5C07@prv-mh.provo.novell.com>
 <b6c539a3-e720-ab09-9feb-8ca91f67379a@citrix.com>
 <5A7AD13D02000078001A5F03@prv-mh.provo.novell.com>
 <c00ada03-04d6-9ed8-55a1-1473cac092d8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c00ada03-04d6-9ed8-55a1-1473cac092d8@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE4IGF0IDE0OjAxLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gU28gZmFyIHRoZSBpc3N1ZSBjb25maXJtZWQ6Cj4gRGVsbCBQb3dlckVkZ2UgUjc0MCwg
SHVhd2VpIHN5c3RlbXMgYmFzZWQgb24gWGVvbiBHb2xkIDYxNTIgKHRoZSBvbmUKPiB0aGF0IGl0
IHdhcyB0ZXN0ZWQgb24pLCBJbnRlbCBTMjYwMFhYLCBldGMuCj4gCj4gQWxzbyBzZWU6Cj4gaHR0
cHM6Ly9idWdzLnhlbnNlcnZlci5vcmcvYnJvd3NlL1hTTy03NzQgCj4gCj4gV2VsbCwgbm8td2F0
Y2hkb2cgaXMgd2hhdCB3ZSBjdXJyZW50bHkgcmVjb21tZW5kIGluIHRoYXQgY2FzZSBidXQgd2UK
PiBob3BlZCB0aGVyZSBpcyBhIGdlbmVyYWwgc29sdXRpb24gaGVyZSBmcm9tIFhlbiBzaWRlLiBZ
b3UgaGF2ZSB5b3VyCj4gcG9pbnQgdGhhdCB0aGV5IHNob3VsZCBmaXggdGhpcyBvbiB0aGVpciBz
aWRlIGJlY2F1c2UgaXQncyB0aGVpciBmYXVsdAo+IGluZGVlZC4gQnV0IHRoZSB1c2VyIGV4cGVy
aWVuY2UgaXMgYWxzbyBpbXBvcnRhbnQgZm9yIHVzIEkgdGhpbmsuCgpPZiBjb3Vyc2UsIGhlbmNl
IHRoZSBzdWdnZXN0aW9uIG9mIHBvc3NpYmxlIGFsdGVybmF0aXZlIHdvcmthcm91bmRzLgpJbXBh
Y3RpbmcgZXZlcnlvbmUgaXMsIGFzIHNhaWQsIG5vdCBhIGRlc2lyYWJsZSBhcHByb2FjaCBpbiBh
IGNhc2UKbGlrZSB0aGlzIG9uZS4gSSBhbHNvIGNvbnRpbnVlIHRvIGRpc2xpa2UgdGhlIHNlZW1p
bmdseSByYW5kb20gZGl2aXNpb24KYnkgMTAuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
