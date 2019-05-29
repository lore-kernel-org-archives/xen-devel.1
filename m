From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] get_maintainer: Improve patch recognition
Date: Wed, 29 May 2019 11:52:10 +0000
Message-ID: <874l5d8oly.fsf@epam.com>
References: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
 <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QpgD=T5=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hVx7u-0003vR-Mi
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:52:14 +0000
In-Reply-To: <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, "xypron.glpk@gmx.de" <xypron.glpk@gmx.de>, "joe@perches.com" <joe@perches.com>, xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

CkhpIEphbiwKCkphbiBCZXVsaWNoIHdyaXRlczoKCj4+Pj4gT24gMjkuMDUuMTkgYXQgMTM6MzUs
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+IEZyb206IEpvZSBQZXJjaGVz
IDxqb2VAcGVyY2hlcy5jb20+Cj4+IAo+PiBGcm9tOiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMu
Y29tPgo+PiAKPj4gVGhlcmUgYXJlIG1vZGUgY2hhbmdlIGFuZCByZW5hbWUgb25seSBwYXRjaGVz
IHRoYXQgYXJlIHVucmVjb2duaXplZAo+PiBieSB0aGUgZ2V0X21haW50YWluZXIucGwgc2NyaXB0
Lgo+PiAKPj4gUmVjb2duaXplIHRoZW0uCj4+CgogWyBVcHN0cmVhbSBjb21taXQgMDQ1NWM3NDc4
OGZkNWFhZDQzOTlmMDBlM2ZiYmI3ZTg3NDUwY2E1OCBdCgo+PiBSZXBvcnRlZC1ieTogSGVpbnJp
Y2ggU2NodWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgo+PiBDQzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMgPGpvZUBw
ZXJjaGVzLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15
cl9iYWJjaHVrQGVwYW0uY29tPgo+Cj4gTWVudGlvbmluZyB0aGUgb3JpZ2luYWwgTGludXggY29t
bWl0IElEIHdvdWxkIGhhdmUgYmVlbiBuaWNlLgpPaCwgdGhhbmsgeW91LiBUaGlzIGlzIHRoZSBm
aXJzdCB0aW1lIEknbSBwb3J0aW5nIHRoZSBwYXRjaCBmcm9tCnRoZSBvdGhlciB0cmVlLgoKLS0g
CkJlc3QgcmVnYXJkcyxWb2xvZHlteXIgQmFiY2h1awpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
