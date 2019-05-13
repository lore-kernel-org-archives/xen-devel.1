From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 0/2] Introduce runstate area registration
 with phys address
Date: Mon, 13 May 2019 11:50:17 +0100
Message-ID: <e10c8cb6-da7f-1ce3-f5b6-4c68a2d85a95@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <fa126315-31af-854e-817a-8640b431c82b@arm.com>
 <CAC1WxdiMzAq5hRC-mhRQuFDs7z_Hj5w7VAy52ec87SJQOGmp3w@mail.gmail.com>
 <a28f95a1-d9da-2caf-f4b4-013100176b02@arm.com>
 <090ce8cc-f329-fe54-4894-b7f12e3cd5a6@gmail.com>
 <3d5ccdcb-d777-e75b-f4bd-38d2d470a754@arm.com>
 <0bd113db-7851-df02-90d1-2a79bd4bedaf@gmail.com>
 <98200ea9-c21e-9d58-498d-468764209972@arm.com>
 <b7cb8324-45ae-8840-b73e-c7dd508e954e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ8XG-0006QF-Fn
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:50:22 +0000
In-Reply-To: <b7cb8324-45ae-8840-b73e-c7dd508e954e@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA1LzgvMTkgNTowMSBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBPbiAwOC4wNS4x
OSAxNzozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJIGhhdmVuJ3Qgc2VlbiB0aGVtIHdpdGgg
bm9rcHRpIHBsYXRmb3JtIHNvIGZhci4gSSBhbSBjdXJpb3VzIHRvIGtub3cgCj4+IHdoYXQgaXMg
eW91ciBjb25maWd1cmF0aW9uIGhlcmUuCj4gCj4gWEVOIDQuMTIgd2l0aCBvdXIgcGF0Y2hlcy4g
VGhpbiBEb20wIGlzIGEgZ2VuZXJpYyBhcm12OCBMaW51eCwgTEsgCj4gNC4xNC43NSB3aXRoIHBh
dGNoZXMgZnJvbSBSZW5lc2FzIGFuZCB1cy4KPiBEb21EIGlzIExLIDQuMTQuNzUgd2l0aCBIVyBh
c3NpZ25lZCBhbmQgZHJpdmVycy4gTEsgY29uZmlncyB5b3UgY2FuIGZpbmQgCj4gb24gbXkgZ29v
Z2xlIGRyaXZlIFsxXS4KPiAKPiBUaG9zZSBmYXVsdHMgZmlyZSBvbmx5IGZvciBEb21EIChvbiBp
dHMgc3RhcnQpLgo+IAo+PiB2Y3B1X3Nob3dfZXhlY3V0aW9uX3N0YXRlKGN1cnJlbnQpIHNob3Vs
ZCBkbyB0aGUgam9iIGhlcmUuCj4gCj4gSGVyZSBpdCBpczoKPiAKPiAoWEVOKSBkMXYyIHBhciAw
eDgwOQo+IChYRU4pIGQxdjI6IEZhaWxlZCB0byB3YWxrIHBhZ2UtdGFibGUgdmEgMHhmZmZmODAw
MDJmZjY2MzU3Cj4gKFhFTikgKioqIER1bXBpbmcgRG9tMSB2Y3B1IzIgc3RhdGU6ICoqKgo+IChY
RU4pIC0tLS1bIFhlbi00LjEyLjDCoCBhcm02NMKgIGRlYnVnPW7CoMKgIE5vdCB0YWludGVkIF0t
LS0tCj4gKFhFTikgQ1BVOsKgwqDCoCAyCj4gKFhFTikgUEM6wqDCoMKgwqAgMDAwMGZmZmZiZDI4
ZGM4OAo+IChYRU4pIExSOsKgwqDCoMKgIDAwMDBmZmZmYmQyOGU2NzQKPiAoWEVOKSBTUF9FTDA6
IDAwMDBmZmZmZTk4OTA0MTAKPiAoWEVOKSBTUF9FTDE6IGZmZmYwMDAwMDgwM2MwMDAKPiAoWEVO
KSBDUFNSOsKgwqAgNDAwMDAwMDAgTU9ERTo2NC1iaXQgRUwwdCAoR3Vlc3QgVXNlcikKClRoaXMg
b25lIGlzIGhhcHBlbmluZyB3aGVuIHRoZSBndWVzdCB3YXMgcnVubmluZyBpbiB1c2VyIG1vZGUu
IElzIGl0IAphbHdheXMgdGhlIGNhc2U/CgpBbHNvLCB5b3VyIERvbUQgLmNvbmZpZyBoYXMgQ09O
RklHX1VOTUFQX0tFUk5FTF9BVF9FTDAuIFNvIGhvdyBkbyB5b3UgCmRpc2FibGUga3B0aT8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
