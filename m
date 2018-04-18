From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 3/9] xen/x86: support per-domain flag for
 xpti
Date: Wed, 18 Apr 2018 11:52:26 +0200
Message-ID: <6e1df3ef-c4b1-df97-794a-1251175aa59c@suse.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-4-jgross@suse.com> <1524044577.8598.4.camel@citrix.com>
 <5AD7149102000078001BC53D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=v9n4=hh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8jlO-00031U-M1
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 09:52:30 +0000
In-Reply-To: <5AD7149102000078001BC53D@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMTggMTE6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA0LjE4IGF0
IDExOjQyLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gV2VkLCAyMDE4
LTA0LTE4IGF0IDEwOjMwICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBAQCAtMTE5LDgg
KzEyMiw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9kZXRhaWxzKGVudW0gaW5kX3RodW5r
IHRodW5rKQo+PiAgICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfUlNCX05BVElW
RSkgICAgICA/ICIgUlNCX05BVElWRSIgOiAiIiwKPj4gICAgICAgICAgICAgYm9vdF9jcHVfaGFz
KFg4Nl9GRUFUVVJFX1JTQl9WTUVYSVQpICAgICAgPyAiIFJTQl9WTUVYSVQiIDogIiIpOwo+PiAg
Cj4+IC0gICAgcHJpbnRrKCJYUFRJOiAlc1xuIiwKPj4gLSAgICAgICAgICAgYm9vdF9jcHVfaGFz
KFg4Nl9GRUFUVVJFX05PX1hQVEkpID8gImRpc2FibGVkIiA6ICJlbmFibGVkIik7Cj4+ICsgICAg
cHJpbnRrKCJYUFRJOiBEb20wICVzLCBEb21VICg2NC1iaXQgUFYgb25seSkgJXNcbiIsCj4+ICsg
ICAgICAgICAgIG9wdF94cHRpICYgT1BUX1hQVElfRE9NMCA/ICJlbmFibGVkIiA6ICJkaXNhYmxl
ZCIsCj4+ICsgICAgICAgICAgIG9wdF94cHRpICYgT1BUX1hQVElfRE9NVSA/ICJlbmFibGVkIiA6
ICJkaXNhYmxlZCIpOwo+PiAgfQo+IAo+IEFoLCB5ZXMsIG1ha2luZyB0aGlzIGxvZyBtZXNzYWdl
IG1vcmUgcHJlY2lzZSBpcyBjZXJ0YWlubHkgd29ydGh3aGlsZS4gVGhlCj4gcGxhY2VtZW50IG9m
ICIoNjQtYml0IFBWIG9ubHkpIiBpcyBhIGxpdHRsZSBjb25mdXNpbmcgdGhvdWdoOiBJJ2QgcHV0
IGl0IGVpdGhlcgo+IGJlZm9yZSB0aGUgY29sb24gb3IgYXQgdGhlIGVuZCBvZiB0aGUgbGluZSwg
YXMgaXQgYWZmZWN0cyBEb20wIGFzIG11Y2ggYXMKPiBEb21VLgoKSSdkIHByZWZlciB0aGUgZm9y
bWVyLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
