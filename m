From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] rombios: work around clang's
 -Waddress-of-packed-member
Date: Fri, 24 Aug 2018 16:32:15 +0100
Message-ID: <20180824153215.7fpmgrhrdaoe777c@citrix.com>
References: <20180824152215.8823-1-wei.liu2@citrix.com>
 <20180824153037.pfxqfuxy4afezc6u@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftE4y-0007c3-Db
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 15:32:52 +0000
Content-Disposition: inline
In-Reply-To: <20180824153037.pfxqfuxy4afezc6u@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMTA6MzA6MzdBTSAtMDUwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDQ6MjI6MTVQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IEJ1aWxkaW5nIHJvbWJpb3Mgd2l0aCBjbGFuZyBYWFggZmFpbHMgd2l0aDoK
Ck9vcHMsIEkgaGF2ZSBtZWFudCB0byByZXBsYWNlIFhYWCB3aXRoIHRoZSByaWdodCB2ZXJzaW9u
IG51bWJlci4KCldpbGwgZml4IHRoYXQgd2hpbGUgY29tbWl0dGluZy4KCj4gPiAKPiA+IHRjZ2Jp
b3MuYzoxNTE5OjM0OiBlcnJvcjogdGFraW5nIGFkZHJlc3Mgb2YgcGFja2VkIG1lbWJlciAndScg
b2YgY2xhc3Mgb3Igc3RydWN0dXJlICdwdXNoYWRfcmVnc190JyBtYXkgcmVzdWx0IGluIGFuIHVu
YWxpZ25lZCBwb2ludGVyIHZhbHVlIFstV2Vycm9yLC1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVy
XQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIMKucy0+
dS5yMzIuZWR4KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+Cj4gPiAKPiA+IFdvcmsgYXJvdW5kIHRoYXQgYnkgdXNpbmcg
YW4gaW50ZXJtZWRpYXRlIHZhcmlhYmxlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
