From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xl: add target cpupool parameter to xl
 migrate
Date: Wed, 3 Oct 2018 10:48:14 +0100
Message-ID: <20181003094814.3w5ardjh6rqezj3k@zion.uk.xensource.com>
References: <20181002141934.21503-1-jgross@suse.com>
 <20181002141934.21503-3-jgross@suse.com>
 <f1c30cd5-4b9e-7fde-62f1-5c88ad6dc6dd@citrix.com>
 <23475.33817.194128.169266@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7dlW-0006CZ-DU
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 09:48:22 +0000
Content-Disposition: inline
In-Reply-To: <23475.33817.194128.169266@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDIsIDIwMTggYXQgMDM6NDM6MzdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvMl0g
eGw6IGFkZCB0YXJnZXQgY3B1cG9vbCBwYXJhbWV0ZXIgdG8geGwgbWlncmF0ZSIpOgo+ID4gSXMg
dGhpcyB0aGUgd2lzZXN0IHdheSB0byBleHRlbmQgdGhlIGludGVyZmFjZT/CoCBXZSBhbHJlYWR5
IGhhdmUgLUMgdG8KPiA+IHNwZWNpZnkgbmV3IGNvbmZpZ3VyYXRpb24sIGFuZCBvbmx5IGhhdmUg
MjYqMiBzaG9ydCBvcHRpb25zIHRvIHVzZS4KPiAKPiBWZXJ5IGdvb2QgcXVlc3Rpb24uCj4gCj4g
PiBXaGF0IGlmIHRoZSB1c2VyIGNvdWxkIHN1cHBseSBhIHhsLmNmZyBzbmlwcGV0IG9uIHRoZSBj
b21tYW5kIGxpbmUgdG8gYmUKPiA+IG1lcmdlZCBvdmVyIHRoZSBleGlzdGluZyBjb25maWd1cmF0
aW9uP8KgIFRoYXQgd291bGQgYWxsb3cgYW55IHBhcmFtZXRlcgo+ID4gdG8gYmUgY2hhbmdlZCwg
cmF0aGVyIHRoYW4ganVzdCB0aGUgY3B1cG9vbC4KPiAKPiArMQoKVGhpcyBpcyBhIGdvb2QgaWRl
YS4gSXQgd291bGQgYmUgYSB3b3J0aHdoaWxlIHRoaW5nIHRvIGRvIG9uIGl0cyBvd24uCgpXZSBh
bHJlYWR5IGhhdmUgY29uZmlnLXVwZGF0ZSwgd2hpY2ggYXQgdGhlIG1vbWVudCBpcyB0byByZXBs
YWNlIGRvbWFpbgpjb25maWd1cmF0aW9uIHdob2xlc2FsZS4gV2UgY2FuIGV4dGVuZCB0aGF0IGNv
bW1hbmQgdG8gbWVyZ2UgZmllbGRzCmluc3RlYWQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
