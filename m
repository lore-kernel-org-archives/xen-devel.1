From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Thu, 6 Sep 2018 18:29:32 +0200
Message-ID: <20180906162932.7qge5dmrgyqbmbbj__26593.6685762883$1536251330$gmane$org@mac.bytemobile.com>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905113515.GU26705@gavran.carpriv.carnet.hr>
 <20180905162801.GB26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yrk1=lu=citrix.com=prvs=780bbe9f7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fxxA6-0007mq-C0
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 16:29:42 +0000
Content-Disposition: inline
In-Reply-To: <20180905162801.GB26705@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, drbd-user@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDY6Mjg6MDFQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gT24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDE6MzU6MTVQTSArMDIwMCwgVmFsZW50
aW4gVmlkaWMgd3JvdGU6Cj4gPiA+IEFGQUlDVCwgdGhpcyB3aWxsIGNhdXNlIHRoZSBiYWNrZW5k
IHRvIG5ldmVyIHN3aXRjaCB0byAnQ2xvc2VkJyBzdGF0ZQo+ID4gPiB1bnRpbCB0aGUgdG9vbHN0
YWNrIHNldHMgb25saW5lIHRvIDAsIHdoaWNoIGlzIG5vdCBnb29kIElNTy4KPiA+ID4gCj4gPiA+
IElmIGZvciBleGFtcGxlIGEgZnJvbnRlbmQgZGVjaWRlcyB0byBjbG9zZSBhIGRldmljZSwgdGhl
IGJhY2tlbmQgd2lsbAo+ID4gPiBzdGF5IGluIHN0YXRlICdDbG9zaW5nJyB1bnRpbCB0aGUgdG9v
bHN0YWNrIGFjdHVhbGx5IHJlbW92ZXMgdGhlIGRpc2sKPiA+ID4gYnkgc2V0dGluZyBvbmxpbmUg
dG8gMC4KPiA+ID4gCj4gPiA+IFRoaXMgd2lsbCBwcmV2ZW50IHJlc2V0dGluZyBibGsgY29ubmVj
dGlvbnMsIGFzIGJsa2JhY2sgd2lsbCByZWZ1c2UgdG8KPiA+ID4gc3dpdGNoIHRvIHN0YXRlIFhl
bmJ1c1N0YXRlSW5pdFdhaXQgdW5sZXNzIGl0J3MgYXQgWGVuYnVzU3RhdGVDbG9zZWQKPiA+ID4g
KHNlZSB0aGUgWGVuYnVzU3RhdGVJbml0aWFsaXNpbmcgY2FzZSBpbiBmcm9udGVuZF9jaGFuZ2Vk
KSwgd2hpY2ggd2lsbAo+ID4gPiBuZXZlciBiZSByZWFjaGVkIHdpdGggeW91ciBwYXRjaC4KPiAK
PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBjYWxsIHhlbl92YmRfZnJlZSBiZWZvcmUgdGhlIHN0
YXRlIGNoYW5nZT8KPiAKPiAgICAgICAgIGNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6Cj4gICAgICAg
ICAgICAgICAgIHhlbl9ibGtpZl9kaXNjb25uZWN0KGJlLT5ibGtpZik7Cj4gICAgICAgICAgICAg
ICAgIHhlbl92YmRfZnJlZSgmYmUtPmJsa2lmLT52YmQpOwo+ICAgICAgICAgICAgICAgICB4ZW5i
dXNfc3dpdGNoX3N0YXRlKGRldiwgWGVuYnVzU3RhdGVDbG9zZWQpOwoKSSB0aGluayB0aGF0IHdp
bGwgYnJlYWsgcmVjb25uZWN0aW9uLCBzaW5jZSB4ZW5fdmJkX2NyZWF0ZSBpcyBvbmx5CmNhbGxl
ZCBhZnRlciBob3RwbHVnIHNjcmlwdCBleGVjdXRpb24gaXMgcGVyZm9ybWVkICh3aGljaCBoYXBw
ZW5zIG9ubHkKb25jZSBhdCBkZXZpY2UgYXR0YWNobWVudCksIGJ1dCBub3Qgd2hlbiBEb21VIGNo
YW5nZXMgZnJvbnRlbmQKc3RhdGUuCgpJZiB5b3Ugd2FudCB0byBwZXJmb3JtIHRoaXMgeGVuX3Zi
ZF9mcmVlIHlvdSB3aWxsIGFsc28gaGF2ZSB0byBtb3ZlCnRoZSB4ZW5fdmJkX2NyZWF0ZSBjYWxs
IEFGQUlDVCwgdG8gYSBwbGFjZSB0aGF0J3MgYWxzbyBjYWxsZWQgd2hlbgpyZWNvbm5lY3Rpbmcg
YSBkZXZpY2UuIE5vdGUgdGhhdCBJIGNvdWxkIGJlIHdyb25nLCBzbyBpdCBtaWdodCBiZQp3b3J0
aCBhIHNob3QgdG8gdHJ5IGRpZmZlcmVudCBhcHByb2FjaGVzIHNpbmNlIHRoZSBibGtiYWNrIGNv
ZGUgaXMKcXVpdGUgdGFuZ2xlZCBhbmQgSSBtaWdodCBtaXNzIHNvbWV0aGluZy4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
