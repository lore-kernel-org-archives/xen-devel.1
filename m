From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v1] stubdom/vtpm: fix memcmp in
 TPM_ChangeAuthAsymFinish
Date: Mon, 25 Jun 2018 09:52:17 +0100
Message-ID: <20180625085217.mdgkl7t26dnvwtlv@citrix.com>
References: <20180618125536.30623-1-olaf@aepfle.de>
 <20180618130446.re3on52wv6gqygdy@var.youpi.perso.aquilenet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180618130446.re3on52wv6gqygdy@var.youpi.perso.aquilenet.fr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xen.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMTgsIDIwMTggYXQgMDM6MDQ6NDZQTSArMDIwMCwgU2FtdWVsIFRoaWJhdWx0
IHdyb3RlOgo+IE9sYWYgSGVyaW5nLCBsZSBsdW4uIDE4IGp1aW4gMjAxOCAxNDo1NTozNiArMDIw
MCwgYSBlY3JpdDoKPiA+IGdjYzggc3BvdHRlZCB0aGlzIGVycm9yOgo+ID4gZXJyb3I6ICdtZW1j
bXAnIHJlYWRpbmcgMjAgYnl0ZXMgZnJvbSBhIHJlZ2lvbiBvZiBzaXplIDggWy1XZXJyb3I9c3Ry
aW5nb3Atb3ZlcmZsb3c9XQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xh
ZkBhZXBmbGUuZGU+Cj4gCj4gSW5kZWVkIQo+IAo+IFJldmlld2VkLWJ5OiBTYW11ZWwgVGhpYmF1
bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+CgpUaGFua3MsIEkgd2lsbCBhcHBseSB0
aGlzIHBhdGNoIG9uY2UgdGhlIHRyZWUgaXMgb3Blbi4KCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
