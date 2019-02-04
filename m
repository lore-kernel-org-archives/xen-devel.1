From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Mon, 4 Feb 2019 22:07:50 +0000
Message-ID: <6e5cdb81-16bc-f5d5-6c96-5e8815d9bb18@arm.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
 <CACMJ4GavEgpvoA9AVLkduLAfD_vmDv7Ne7JqcU2atSO4vhiphg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c77d=QL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gqmPH-000863-Tf
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 22:07:59 +0000
In-Reply-To: <CACMJ4GavEgpvoA9AVLkduLAfD_vmDv7Ne7JqcU2atSO4vhiphg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQ2hyaXN0b3BoZXIsCgpPbiAyLzQvMTkgODozMiBQTSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3Jv
dGU6Cj4gT24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgODoxNCBQTSBDaHJpc3RvcGhlciBDbGFyawo+
IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgSmFu
IDI1LCAyMDE5IGF0IDEwOjU1IEFNIENocmlzdG9waGVyIENsYXJrCj4+IDxjaHJpc3RvcGhlci53
LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gVGh1LCBKYW4gMjQsIDIwMTkgYXQg
MjowOCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBb
Li4uXQo+Pj4+IFNvcnJ5IGZvciBub3RpY2luZyBxdWl0ZSBsYXRlIGluIHRoZSBwcm9jZXNzLiBE
b24ndCB5b3UgbmVlZCB0byBhZGQgdGhlCj4+Pj4gaHlwZXJjYWxsIGluIHhlbi9hcmNoL2FybS90
cmFwcy5jPwo+Pgo+PiBBZGRpbmcgdGhpcyBsb29rZWQgZmluZSwgc28gSSd2ZSBhZGRlZCB0aGUg
QVJNIGh5cGVyY2FsbCB0YWJsZSBlbnRyeSB0bwo+PiB0aGlzIHBhdGNoLgo+IAo+IEp1bGllbiwg
ZG8geW91IGhhdmUgYW55IGZ1cnRoZXIgZmVlZGJhY2sgb24gdGhlIGxhdGVzdCB2ZXJzaW9uIG9m
IHRoaXMgcGF0Y2g/CgpJIHdpbGwgbm90IGJlIGFibGUgdG8gbG9vayBhdCB0aGUgc2VyaWVzIHRo
aXMgd2Vlay4gSSBkZWZlciB0aGUgQXJtIHBhcnQgCnRvIFN0ZWZhbm8uCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
