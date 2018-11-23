From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] common: make sure symbols-dummy.o gets
 rebuilt when needed
Date: Fri, 23 Nov 2018 03:13:05 -0700
Message-ID: <5BF7D2B102000078001FF4D0@prv1-mh.provo.novell.com>
References: <5BF6894D02000078001FECE2@prv1-mh.provo.novell.com>
 <20181122153049.gu6jbtkm7muqvzz4@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gQ8ST-0005JH-Ox
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 10:13:09 +0000
In-Reply-To: <20181122153049.gu6jbtkm7muqvzz4@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDE2OjMwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDM6NDc6NDFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQo+PiArKysgYi94ZW4vYXJjaC9hcm0v
TWFrZWZpbGUKPj4gQEAgLTEwMCw5ICsxMDAsNiBAQCBwcmVsaW5rLm86ICQoQUxMX09CSlMpCj4+
ICAJJChMRCkgJChMREZMQUdTKSAtciAtbyAkQCAkXgo+PiAgZW5kaWYKPj4gIAo+PiAtJChCQVNF
RElSKS9jb21tb24vc3ltYm9scy1kdW1teS5vOgo+PiAtCSQoTUFLRSkgLWYgJChCQVNFRElSKS9S
dWxlcy5tayAtQyAkKEJBU0VESVIpL2NvbW1vbiBzeW1ib2xzLWR1bW15Lm8KPj4gLQo+PiAgJChU
QVJHRVQpLXN5bXM6IHByZWxpbmsubyB4ZW4ubGRzICQoQkFTRURJUikvY29tbW9uL3N5bWJvbHMt
ZHVtbXkubwoKSSd2ZSBkb25lIHRoaXMsIGJ1dCBJJ3ZlIHRob3VnaHQgb2YgYW5vdGhlciBwcm9i
bGVtIHRoZSBjaG9zZW4KYXBwcm9hY2ggY2F1c2VzIChhbmQgbWVhbndoaWxlIHZlcmlmaWVkIGl0
IGluZGVlZCBkb2VzKTogVGhlCm5ldyBkZXBlbmRlbmN5IG9uIHRoZSBwaG9ueSAiZXh0cmEiIHRh
cmdldCBjYXVzZXMgYSBmdWxsIHJlLWxpbmsKZHVyaW5nICJtYWtlIGluc3RhbGwteGVuIiwgcmVz
dWx0aW5nIGluIHZhcmlvdXMgZmlsZXMgdGhhdCBhcmUKc3VwcG9zZWQgdG8gYmUgb3JkaW5hcnkt
dXNlci1vd25lZCB0byBiZWNvbWUgcm9vdC1vd25lZC4gSQp0aGluayBJIHdhbnQvbmVlZCB0byBp
bnZlbnQgc29tZSB0cmlja2VyeSBzaW1pbGFyIHRvIHRoYXQgaW4gdGhlCmRlbGV0ZS11bmZyZXNo
LWZpbGVzIHJ1bGUuCgpPZiBjb3Vyc2UgdGhlIHF1ZXN0aW9uIGNvbnRpbnVlcyB0byBiZSAoSSd2
ZSByYWlzZWQgdGhpcyB5ZWFycwpiZWZvcmUgYWxyZWFkeSkgd2h5IHdlIGRvIGEgZnVsbCByZWJ1
aWxkIGN5Y2xlIGluIHRoZSBmaXJzdCBwbGFjZQpkdXJpbmcgdGhlIGluc3RhbGwgcGhhc2UuIHg4
NiBMaW51eCwgZm9yIGV4YW1wbGUsIGF2b2lkcyB0aGlzCihidXQgTGludXggYXMgYSB3aG9sZSBp
cyBpbmNvbnNpc3RlbnQsIGFzIElTVFIgaW4gdGhlIGlhNjQgY2FzZQphIGZ1bGwgcmUtYnVpbGQg
Z2V0cyB0cmlnZ2VyZWQuCgpUaGUgb3RoZXIgYWx0ZXJuYXRpdmUgSSBjYW4gc2VlIHdvdWxkIHJl
cXVpcmUgcXVpdGUgYSBiaXQgbW9yZQpzdXJnZXJ5OiBXZSBjb3VsZCBzdG9wIGtleWluZyBzdWIt
ZGlyZWN0b3J5IHRyYXZlcnNhbHMgb2ZmIG9mCnRoZSByZXNwZWN0aXZlIGJ1aWx0X2luLm8gZmls
ZXMsIHN1Y2ggdGhhdCB0aG9zZSBkb24ndCBuZWVkIHRvCmRlcGVuZCBvbiB0aGlzIG5ldyBwaG9u
eSB0YXJnZXQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
