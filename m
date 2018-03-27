From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC 4/4] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Tue, 27 Mar 2018 15:20:54 +0100
Message-ID: <20180327142054.GE2208@perard>
References: <20180326183401.17249-1-anthony.perard@citrix.com>
 <20180326183401.17249-5-anthony.perard@citrix.com>
 <23226.7824.260388.684497@mariner.uk.xensource.com>
 <20180327111303.GA5743@perard>
 <23226.19066.774399.262624@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sg2s=gr=citrix.com=prvs=61706adb2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f0pW2-0001pW-1q
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:23:58 +0000
Content-Disposition: inline
In-Reply-To: <23226.19066.774399.262624@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDI6NDM6MjJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtSRkMgNC80XSBI
QUNLIGxpYnhsX2V4ZWM6IENoZWNrIFFFTVUgc3RhdHVzIHZpYSBRTVAgaW5zdGVhZCBvZiB4ZW5z
dG9yZSIpOgo+ID4gQWN0dWFsbHksIEkgdGhpbmsgdGhhdCBvbmNlIGNvbm5lY3RlZCB0byBRTVAs
IHdlIGNhbiBnZXQgImV2ZW50cyIgZnJvbQo+ID4gUUVNVS4gQW5kIHRoZXJlIGlzIGFuIGV2ZW50
IGZvciB3aGVuIHFlbXUgY2hhbmdlcyBpdCdzIHN0YXR1cy4KPiAKPiBSaWdodCwgYnV0IGRvZXNu
J3Qgb25lIHN0aWxsIGhhdmUgdG8gcG9sbCBvbiBjb25uZWN0KCkgPwoKWWVzLCB3ZSBuZWVkIHRv
IHBvbGwgb24gY29ubmVjdCgpLgoKbGlidmlydCB0aG9zZSBpdCBhbHNvIHRvIG9wZW4gdGhlIHNv
Y2tldDoKaHR0cHM6Ly9saWJ2aXJ0Lm9yZy9naXQvP3A9bGlidmlydC5naXQ7YT1ibG9iO2Y9c3Jj
L3FlbXUvcWVtdV9tb25pdG9yLmM7aD1lMTY5NTUzYjdlMTc4MWRhMzA3ZGRiMGJlMjNmZWQ1NTQw
YmFmMzZjO2hiPUhFQUQjbDM3NQoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
