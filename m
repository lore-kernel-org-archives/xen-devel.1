From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 6/6] osstest: add FreeBSD Xen build job
Date: Thu, 5 Jul 2018 16:25:06 +0100
Message-ID: <23358.14418.586354.133378@mariner.uk.xensource.com>
References: <20180705141040.39988-1-roger.pau@citrix.com>
 <20180705141040.39988-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb686-0006yc-Bc
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:25:10 +0000
In-Reply-To: <20180705141040.39988-7-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCA2LzZdIG9zc3Rlc3Q6IGFkZCBGcmVlQlNE
IFhlbiBidWlsZCBqb2IiKToKLi4uCj4gK2NyZWF0ZV9mcmVlYnNkX3hlbl9idWlsZF9qb2IgKCkg
ewo+ICsgIGpvYl9jcmVhdGVfYnVpbGQgYnVpbGQtJGFyY2gteGVuJHhzbV9zdWZmaXgtZnJlZWJz
ZCBidWlsZC14ZW4tZnJlZWJzZCAgICBcCj4gKyAgICBhcmNoPSRhcmNoICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIGVu
YWJsZV94c209JGVuYWJsZV94c20gJGxpdmVwYXRjaF9ydW52YXJzICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgdHJlZV9xZW11dT0kVFJFRV9RRU1VX1VQU1RSRUFNICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICB0cmVlX3hlbj0kVFJF
RV9YRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgIHRyZWVfc2VhYmlvcz0kVFJFRV9TRUFCSU9TICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgJFJVTlZBUlMgJEJVSUxEX1JVTlZBUlMg
JEJVSUxEX1hFTl9SVU5WQVJTICRhcmNoX3J1bnZhcnMgICAgICAgICAgICAgICBcCj4gKyAgICBo
b3N0X2hvc3RmbGFncz1hcmNoLSRhcmNoLHB1cnBvc2UtYnVpbGQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiArICAgIHJldmlzaW9uX3hlbj0kUkVWSVNJT05fWEVOICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgcmV2aXNpb25fcWVt
dT0kUkVWSVNJT05fUUVNVSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gKyAgICByZXZpc2lvbl9xZW11dT0kUkVWSVNJT05fUUVNVV9VUFNUUkVBTSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHJldmlzaW9uX3NlYWJpb3M9JFJFVklT
SU9OX1NFQUJJT1MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAg
YWxsX2hvc3Rfb3M9ZnJlZWJzZCAkZnJlZWJzZF9ydW52YXJzCgpDYW4gd2Ugbm90IGhhdmUgeGVu
X2J1aWxkX2pvYl9ydW52YXJzIG9yIHNvbWV0aGluZyA/ICBUaGlzIGlzIHN0aWxsCnZlcnkgc2lt
aWxhciB0byB3aGF0IGlzIGluIG1maS1jb21tb24ncyBjcmVhdGVfYnVpbGRfam9icy4KClRoZSBy
ZXN0IG9mIHRoaXMgbG9va3MgZmluZSB0byBtZS4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
