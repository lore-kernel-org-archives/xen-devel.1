From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] xen/pvshim: map vcpu_info earlier for
	APs
Date: Thu, 18 Jan 2018 01:35:04 -0700
Message-ID: <5A606A48020000780019FB95@prv-mh.provo.novell.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-2-roger.pau@citrix.com>
 <20180117105035.2tksacgkb4af7ugm@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udw+=en=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ec5fD-0008I6-VY
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 08:35:11 +0000
In-Reply-To: <20180117105035.2tksacgkb4af7ugm@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE4IGF0IDExOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMDk6NDg6MDlBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+PiBPciBlbHNlIGluaXRfcGVyY3B1X3RpbWUgaXMgZ29pbmcgdG8gZGVyZWZlcmVu
Y2UgYSBOVUxMIHBvaW50ZXIgd2hlbgo+PiB0cnlpbmcgdG8gYWNjZXNzIHZjcHVfaW5mby4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
