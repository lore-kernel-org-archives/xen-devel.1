From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] Add pvcalls info to xl man page and add
 missing LIBXL_HAVE_PVCALLS
Date: Tue, 3 Apr 2018 16:05:50 +0100
Message-ID: <20180403150550.pmrxmvzphfur7zfs@citrix.com>
References: <1522431113-19126-1-git-send-email-sstabellini@kernel.org>
 <20180403102907.aoa2csahfs6o3vfu@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0tpn=gy=citrix.com=prvs=624464b1e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f3Ng0-0006GB-Gu
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 15:16:48 +0000
Content-Disposition: inline
In-Reply-To: <20180403102907.aoa2csahfs6o3vfu@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <stefano@aporeto.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDMsIDIwMTggYXQgMTE6Mjk6MDdBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIE1hciAzMCwgMjAxOCBhdCAxMDozMTo1M0FNIC0wNzAwLCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBBZGQgYSBzaG9ydCBlbnRyeSB0byB0aGUgeGwuY2Zn
IG1hbiBwYWdlIGFib3V0IHB2Y2FsbHMuCj4gPiBBbHNvIGFkZCBMSUJYTF9IQVZFX1BWQ0FMTFMg
dG8gbWFyayB0aGUgcHJlc2VuY2Ugb2YgcHZjYWxscyBzdXBwb3J0IGluCj4gPiBsaWJ4bC4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8u
Y29tPgo+ID4gLS0tCj4gPiAgZG9jcy9tYW4veGwuY2ZnLnBvZC41LmluIHwgNyArKysrKysrCj4g
PiAgdG9vbHMvbGlieGwvbGlieGwuaCAgICAgIHwgNyArKysrKysrCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5j
ZmcucG9kLjUuaW4gYi9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4KPiA+IGluZGV4IDJjMWE2ZTEu
LjQ3ZDg4MjQgMTAwNjQ0Cj4gPiAtLS0gYS9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4KPiA+ICsr
KyBiL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgo+ID4gQEAgLTY4NSw2ICs2ODUsMTMgQEAgU3Bl
Y2lmeSB0aGUgYmFja2VuZCBkb21haW4gbmFtZSBvciBpZCwgZGVmYXVsdHMgdG8gZG9tMC4KPiA+
ICAKPiA+ICA9YmFjawo+ID4gIAo+ID4gKz1pdGVtIEI8cHZjYWxscz1bICJiYWNrZW5kPWRvbWFp
bi1pZCIsIC4uLiBdPgo+IAo+IFRoZSAnYmFja2VuZCcgcGFyYW1ldGVyIGluIHRoZSBkaXNrIGNv
bmZpZyBbMF0gY29udGFpbnMgdGhlIGRvbWFpbiBuYW1lLAo+IG5vdCB0aGUgZG9tYWluIGlkLiBJ
IHRoaW5rIGl0IHdvdWxkIGJlIGdvb2QgdG8ga2VlcCB0aGUgc2FtZQo+IHNlbWFudGljcyBmb3Ig
Ym90aC4KPiAKPiBUaGFua3MsIFJvZ2VyLgo+IAo+IFswXSBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9kb2NzL3Vuc3RhYmxlL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5odG1sCgpJIHRoaW5r
IHRoYXQncyBvbmx5IGEgbWF0dGVyIG9mIGFtYmlndW91cyB3b3JkaW5nLiBJdCBzaG91bGQgc3Vw
cG9ydApib3RoIGEgbmFtZSBhbmQgYSBkb21pZCAtLSBsaWJ4bF9fcmVzb2x2ZV9kb21pZCBoYW5k
bGVzIGJvdGguCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
