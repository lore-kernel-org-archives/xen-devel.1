From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] libxc: fix HVM core dump
Date: Wed, 20 Mar 2019 16:55:37 +0000
Message-ID: <20190320165537.GV14641@zion.uk.xensource.com>
References: <20190320154338.24124-1-wei.liu2@citrix.com>
 <23698.27931.528014.517502@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OKdL=RX=citrix.com=prvs=975c6da73=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6eVJ-00017a-Cb
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 16:55:49 +0000
Content-Disposition: inline
In-Reply-To: <23698.27931.528014.517502@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMDQ6NDA6NTlQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggdjJdIGxpYnhjOiBmaXggSFZNIGNvcmUgZHVt
cCIpOgo+ID4gZjk2OWJjOWZjOTYgZm9yYmlkIGdldF9hZGRyZXNzX3NpemUgY2FsbCBvbiBIVk0g
Z3Vlc3RzLCBiZWNhdXNlIHRoYXQKPiA+IGRpZG4ndCBtYWtlIHNlbnNlLiBJdCBicm9rZSBjb3Jl
IGR1bXAgZnVuY3Rpb25hbGl0eSBvbiBIVk0gYmVjYXVzZQo+ID4gbGlieGMgdW5jb25kaXRpb25h
bGx5IGFza2VkIGZvciBndWVzdCB3aWR0aC4KPiA+IAo+ID4gRm9yY2UgZ3Vlc3Rfd2lkdGggdG8g
YSBzZW5zaWJsZSB2YWx1ZS4KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IElnb3IgRHJ1emhpbmluIDxp
Z29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPiAKPiBMR1RNLiAgVGhhbmtzIGZvciB0aGUgY29waW91cyBjb21t
ZW50Lgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KClRoYW5rcy4gUHVzaGVkLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
