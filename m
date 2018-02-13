From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/nmi: lower initial watchdog frequency
 to avoid boot hangs
Date: Tue, 13 Feb 2018 02:03:56 -0700
Message-ID: <5A82B80C02000078001A7356@prv-mh.provo.novell.com>
References: <1517865522-3248-1-git-send-email-igor.druzhinin@citrix.com>
 <5A79E0CB02000078001A5BBA@prv-mh.provo.novell.com>
 <990db14d-4ee2-bf95-20b4-1a050fc8fc9e@citrix.com>
 <5A79E49A02000078001A5C07@prv-mh.provo.novell.com>
 <b6c539a3-e720-ab09-9feb-8ca91f67379a@citrix.com>
 <5A7AD13D02000078001A5F03@prv-mh.provo.novell.com>
 <c00ada03-04d6-9ed8-55a1-1473cac092d8@citrix.com>
 <5A7B086E02000078001A6095@prv-mh.provo.novell.com>
 <7e4501cd-08ad-2029-d1bf-1ea5517d160c@citrix.com>
 <5A7B23FC02000078001A613F@prv-mh.provo.novell.com>
 <0cd19fe5-02b3-fae9-9b16-2cc44b169f7e@citrix.com>
 <5A7C228D02000078001A649E@prv-mh.provo.novell.com>
 <9042c7e8-6ac0-525b-4b3e-fb376dbcc604@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9042c7e8-6ac0-525b-4b3e-fb376dbcc604@citrix.com>
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE4IGF0IDEzOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gV2Ugc3dpdGNoIHRoZSBOTUkgZnJlcXVlbmN5IHRvIH4ySHogYWZ0ZXIgdGhlIGNhbGli
cmF0aW9uLCBidXQgdGhhdCBpcwo+IGFmdGVyIGhhdmluZyBydW4gdGhlIEJTUCBhdCAxMDBIeiBm
b3IgYSBsb25nIHBlcmlvZCBvZiB0aW1lLCBhbmQgdGhlIEFQcwo+IGF0IHRoaXMgcmF0ZSBmb3Ig
YSBzaG9ydCB3aGlsZS4gIElycmVzcGVjdGl2ZSBvZiB0aGUgZXhhY3QgZml4IGhlcmUsIGl0Cj4g
aXMgc2ltcGx5IG5vdCBhIGdvb2QgaWRlYSB0byBiZSBydW5uaW5nIHdpdGggdGhpcyBOTUkgZnJl
cXVlbmN5LCBvdGhlcgo+IHRoYW4gcG9zc2libHkgZHVyaW5nIHRoZSBpbW1lZGlhdGUgY2FsaWJy
YXRpb24gbG9naWMuCgpBbmQgSSd2ZSBwcmV2aW91c2x5IGFncmVlZCB3aXRoIHRoaXMgZ2VuZXJh
bCBzdGF0ZW1lbnQuIEl0J3MKanVzdCB0aGF0IHRoZSBzbyBmYXIgc3VnZ2VzdGVkIHdvcmthcm91
bmQgZG9lc24ndCByZWFsbHkgZG8Kd2hhdCB5b3Ugc2F5IChhbmQgSSdtIHByZXR0eSBkZXRlcm1p
bmVkIHRoYXQgdGhlICJwb3NzaWJseSIKYWJvdmUgc2hvdWxkIGJlIHJlbW92ZWQpLgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
