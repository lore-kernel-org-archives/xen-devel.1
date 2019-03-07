From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 0/2 for-4.12] Introduce runstate area
 registration with phys address
Date: Thu, 7 Mar 2019 17:16:45 +0100
Message-ID: <20190307161645.bs3u44czjkak7f34@Air-de-Roger>
References: <1551791671-21703-1-git-send-email-andrii.anisov@gmail.com>
 <c3a5728c-6425-29f9-8e5c-7b6da1f729ce@arm.com>
 <be2b4a60-d70d-9d28-d638-1a7fd11f0578@gmail.com>
 <59a2f220-5c90-381c-2c52-bb2cdb813e8e@arm.com>
 <e98e3651-c780-0bb8-d2ad-db1675b00c28@gmail.com>
 <fead3a5e-dd87-bd91-e07a-f7d0f068a88f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <fead3a5e-dd87-bd91-e07a-f7d0f068a88f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xen.org, Andrii Anisov <andrii_anisov@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDM6MTc6NTRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEFuZHJpaSwKPiAKPiBPbiAwNy8wMy8yMDE5IDE0OjM0LCBBbmRyaWkgQW5pc292
IHdyb3RlOgo+ID4gT24gMDcuMDMuMTkgMTY6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4g
PiDCoMKgLSBJTUhPLCB0aGlzIGltcGxlbWVudGF0aW9uIGlzIHNpbXBsZXIgYW5kIGNsZWFuZXIg
dGhhbiB3aGF0IEkKPiA+ID4gPiBoYXZlIGZvciBydW5zdGF0ZSBtYXBwaW5nIG9uIGFjY2Vzcy4K
PiA+ID4gCj4gPiA+IERpZCB5b3UgaW1wbGVtZW50IGl0IHVzaW5nIGFjY2Vzc19ndWVzdF9tZW1v
cnlfYnlfaXBhPwo+ID4gTm90IGV4YWN0bHksIGFjY2Vzc19ndWVzdF9tZW1vcnlfYnlfaXBhKCkg
aGFzIG5vIGltcGxlbWVudGF0aW9uIGZvciB4ODYuCj4gPiBCdXQgaXQgaXMgbWFkZSBhcm91bmQg
dGhhdCBjb2RlLgo+IAo+IEZvciB0aGUgSFZNLCB0aGUgZXF1aXZhbGVudCBmdW5jdGlvbiBpcyBo
dm1fY29weV90b19ndWVzdF9waHlzLiBJIGRvbid0IGtub3cKPiB3aGF0IHdvdWxkIGJlIHRoZSBp
bnRlcmZhY2UgZm9yIFBWLiBSb2dlciwgYW55IGlkZWE/CgpGb3IgUFYgSSB0aGluayB5b3Ugd2ls
bCBoYXZlIHRvIHVzZSBnZXRfcGFnZV9mcm9tX2dmbiwgY2hlY2sgdGhlCnBlcm1pc3Npb25zLCBt
YXAgaXQsIHdyaXRlIGFuZCB1bm1hcCBpdC4gVGhlIHNhbWUgZmxvdyB3b3VsZCBhbHNvIHdvcmsK
Zm9yIEhWTSwgc28gSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3MgbXVjaCBwb2ludCBpbiB1c2luZwpo
dm1fY29weV90b19ndWVzdF9waHlzLiBPciB5b3UgY2FuIGltcGxlbWVudCBhIGdlbmVyaWMKY29w
eV90b19ndWVzdF9waHlzIGhlbHBlciB0aGF0IHdvcmtzIGZvciBib3RoIFBWIGFuZCBIVk0uCgpO
b3RlIHRoYXQgZm9yIHRyYW5zbGF0ZWQgZ3Vlc3RzIHlvdSB3aWxsIGhhdmUgdG8gd2FsayB0aGUg
SEFQIHBhZ2UKdGFibGVzIGZvciBlYWNoIHZDUFUgZm9yIGVhY2ggY29udGV4dCBzd2l0Y2gsIHdo
aWNoIEkgdGhpbmsgd2lsbCBiZQpleHBlbnNpdmUgaW4gdGVybXMgb2YgcGVyZm9ybWFuY2UgKEkg
bWlnaHQgYmUgd3JvbmcgaG93ZXZlciwgc2luY2UgSQpoYXZlIG5vIHByb29mIG9mIHRoaXMpLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
