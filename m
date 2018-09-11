From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4] xen: avoid crash in disable_hotplug_cpu
Date: Tue, 11 Sep 2018 09:55:07 +0200
Message-ID: <6b51f88f-7f40-ded4-0202-e4c31fa606a2__4755.27039166099$1536652431$gmane$org@suse.com>
References: <20180907143135.29608-1-olaf@aepfle.de>
 <4f623671-e1aa-1804-449c-a26b0c4b9ce9@oracle.com>
 <20180911095258.5ed9e9b7.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=i2ua=lz=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fzdVu-0002rB-LK
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 07:55:10 +0000
In-Reply-To: <20180911095258.5ed9e9b7.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDkvMTggMDk6NTIsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IEFtIEZyaSwgNyBTZXAgMjAx
OCAxMjo1NjozNyAtMDQwMAo+IHNjaHJpZWIgQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT46Cj4gCj4+IEkgd2FzIGhvcGluZyB5b3UnZCByZXNwb25kIHRvIG15IHF1
ZXN0aW9uIGFib3V0IHdhcm5pbmcuCj4gCj4gSXQgbG9va3MgbGlrZSBDT05GSUdfQk9PVFBBUkFN
X0hPVFBMVUdfQ1BVMD15IGlzIHRoZSByZWFzb24gZm9yIHRoZSB3YXJuaW5nLgo+IEFzIErDvHJn
ZW4gc3VnZ2VzdGVkIGluIGFub3RoZXIgbWFpbCwgWGVuIHNob3VsZCBwcm9iYWJseSBkaXNhYmxl
IGhvdHBsdWdnaW5nCj4gZm9yIGNwdSMwIGluIHRoZSBnZW5lcmljIHNldHVwIGNvZGUuIFRoZW4g
Y3B1X2lzX2hvdHBsdWdnYWJsZShjcHUpIHdvdWxkCj4gZG8gdGhlIHJpZ2h0IHRoaW5nLgo+IAo+
IERvIHlvdSB3YW50IG1lIHRvIG1lcmdlIHRoYXQgZXh0cmEgY2hhbmdlIGludG8gdGhpcyBwYXRj
aD8KCkkgdGhpbmsgYW4gZXh0cmEgcGF0Y2ggd291bGQgYmUgYmV0dGVyLCBhcyBpdCBpcyBhIGRp
ZmZlcmVudCBpc3N1ZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
