From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/msr: Fix fallout from mostly c/s 832c180
Date: Mon, 15 Apr 2019 10:03:56 +0100
Message-ID: <20190415090356.GL30543@zion.uk.xensource.com>
References: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDY6NTM6NDdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBAQCAtNjkyLDYgKzY5Miw3IEBAIHVuc2lnbmVkIGxvbmcgaHZtX2dldF9zaGFkb3df
Z3NfYmFzZShzdHJ1Y3QgdmNwdSAqdik7Cj4gIHZvaWQgaHZtX3NldF9pbmZvX2d1ZXN0KHN0cnVj
dCB2Y3B1ICp2KTsKPiAgdm9pZCBodm1fY3B1aWRfcG9saWN5X2NoYW5nZWQoc3RydWN0IHZjcHUg
KnYpOwo+ICB2b2lkIGh2bV9zZXRfdHNjX29mZnNldChzdHJ1Y3QgdmNwdSAqdiwgdWludDY0X3Qg
b2Zmc2V0LCB1aW50NjRfdCBhdF90c2MpOwo+ICtib29sIGh2bV9nZXRfZ3Vlc3RfYm5kY2Zncyhz
dHJ1Y3QgdmNwdSAqdiwgdWludDY0X3QgKnZhbCk7CgpOb3cgdGhhdCBvc3N0ZXN0IGlzIGxhcmdl
bHkgYmFjayB0byBub3JtYWwsIGNhbiB3ZSBjb21taXQgdGhpcyBwYXJ0IHNvCnRoYXQgdGhlIGJ1
aWxkIGlzIGZpeGVkIGFuZCBnZXQgc29tZSB0ZXN0cyBydW4gb24gdGhlIHg4NiBzaWRlPwoKV2Vp
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
