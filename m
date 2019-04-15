From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/msr: Fix fallout from mostly c/s 832c180
Date: Mon, 15 Apr 2019 11:29:49 +0200
Message-ID: <00ee9f5b-0843-ab45-429a-0f190fb13ac5@suse.com>
References: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
 <20190415090356.GL30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190415090356.GL30543@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDQvMjAxOSAxMTowMywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEFwciAwOSwgMjAx
OSBhdCAwNjo1Mzo0N1BNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBAQCAtNjkyLDYg
KzY5Miw3IEBAIHVuc2lnbmVkIGxvbmcgaHZtX2dldF9zaGFkb3dfZ3NfYmFzZShzdHJ1Y3QgdmNw
dSAqdik7Cj4+ICB2b2lkIGh2bV9zZXRfaW5mb19ndWVzdChzdHJ1Y3QgdmNwdSAqdik7Cj4+ICB2
b2lkIGh2bV9jcHVpZF9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgdmNwdSAqdik7Cj4+ICB2b2lkIGh2
bV9zZXRfdHNjX29mZnNldChzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3Qgb2Zmc2V0LCB1aW50NjRf
dCBhdF90c2MpOwo+PiArYm9vbCBodm1fZ2V0X2d1ZXN0X2JuZGNmZ3Moc3RydWN0IHZjcHUgKnYs
IHVpbnQ2NF90ICp2YWwpOwo+IAo+IE5vdyB0aGF0IG9zc3Rlc3QgaXMgbGFyZ2VseSBiYWNrIHRv
IG5vcm1hbCwgY2FuIHdlIGNvbW1pdCB0aGlzIHBhcnQgc28KPiB0aGF0IHRoZSBidWlsZCBpcyBm
aXhlZCBhbmQgZ2V0IHNvbWUgdGVzdHMgcnVuIG9uIHRoZSB4ODYgc2lkZT8KClllcywgcGxlYXNl
ISBUaGlzIGlzIGEgbmVlZGVkIGZpeCBmb3IgZ2V0dGluZyBhIHB1c2guCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
