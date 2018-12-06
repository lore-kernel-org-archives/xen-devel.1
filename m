From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] xen: introduce
 parse_size_and_unit_or_int
Date: Thu, 6 Dec 2018 11:19:35 +0100
Message-ID: <a64da7d6-cdc1-8175-044b-9b95c9dd5760@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nlhD=OP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gUqku-0000tT-Ec
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 10:19:40 +0000
References: =?UTF-8?B?PDIwMTgxMjA2MDgwNjM5LjMyNjAz77+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTgxMjA2MDgwNjM5LjMyNjAz77+9Mu+/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c5C08F0CE0200007800203751=40suse=2ecom=3e_=3c1da9c664-5933?=
 =?UTF-8?Q?-d68b-12fa-839c4f392707=40suse=2ecom=3e_=3c5C08F6A902000078002039?=
 =?UTF-8?B?MUVAc3VzZS5jb20+?=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMTIuMTgg
YXQgMTE6MDEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwNi8xMi8yMDE4IDEwOjUw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA2LjEyLjE4IGF0IDA5OjA2LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBAQCAtNDc3LDcgKzQ3OCw4IEBAIHVuc2lnbmVkIGxvbmcg
bG9uZyBwYXJzZV9zaXplX2FuZF91bml0KGNvbnN0IGNoYXIgKnMsIAo+PiBjb25zdCBjaGFyICoq
cHMpCj4+Pj4gICAgICAgICAgczErKzsKPj4+PiAgICAgICAgICBicmVhazsKPj4+PiAgICAgIGRl
ZmF1bHQ6Cj4+Pj4gLSAgICAgICAgcmV0IDw8PSAxMDsgLyogZGVmYXVsdCB0byBrQiAqLwo+Pj4+
ICsgICAgICAgIGlmICggKnMxICYmICpzMSAhPSBub19zaXplICkKPj4+PiArICAgICAgICAgICAg
cmV0IDw8PSAxMDsgLyogZGVmYXVsdCB0byBrQiAqLwo+Pj4+ICAgICAgICAgIGJyZWFrOwo+Pj4K
Pj4+IFNvIGRpZCB5b3UgZmlndXJlIGFueXRoaW5nIHdyb25nIHdpdGggc2ltcGx5IHNwZWNpYWwg
Y2FzaW5nICclJwo+Pj4gaGVyZT8gJyUnIGlzIGEgZm9ybSBvZiAidW5pdCIsIGFmdGVyIGFsbC4g
UGVyaGFwcyBkZW1hbmRpbmcgInBzIgo+Pj4gdG8gYmUgbm9uLU5VTEwgKHRvIGhhdmUgc29tZSBm
b3JtIG9mIGluZGljYXRpb24gdGhlIGNhbGxlciB3aWxsCj4+PiBjaGVjayB0aGUgc3VmZml4IGNo
YXIpIG1pZ2h0IGJlIHJlYXNvbmFibGUuCj4+Cj4+IEkgdGhvdWdodCBhIG1vcmUgZ2VuZXJhbCBh
cHByb2FjaCB3b3VsZCBiZSBiZXR0ZXIuIEkgY2FuIHVzZSB0aGUgc2ltcGxlCj4+ICclJyBzcGVj
aWFsIGNhc2Ugd2l0aCB0aGUgcHMgY2hlY2sgaW4gY2FzZSB5b3UgcHJlZmVyIHRoYXQuCj4gCj4g
SSdkIGluZGVlZCBwcmVmZXIgdGhhdCwgZmlyc3QgYW5kIGZvcmVtb3N0IGJlY2F1c2UgdGhhdCBv
dGhlcgo+IGZ1bmN0aW9uJ3MgbmFtZSBiZWNvbWVzIHRvbyBsb25nIGZvciBteSB0YXN0ZSwgYnV0
IGdpdmUgb3RoZXJzCj4gYSBjaGFuY2UgdG8gdm9pY2UgZGlmZmVyaW5nIG9waW5pb25zLgoKSW4g
Y2FzZSB0aGUgZnVuY3Rpb24gbmFtZSBpcyB5b3VyIG1haW4gY29uY2VybiBJIGNvdWxkIHJlbmFt
ZSBpdCB0bwpwYXJzZV9zaXplX29yX2ludCgpIG9yIHNpbWlsYXIuCgpJJ20gZmluZSBlaXRoZXIg
d2F5LCBzbyBsZXRzIHdhaXQgZm9yIHNvbWUgZGF5cyBhbmQgYWN0IHRoZW4gYWNjb3JkaW5nCnRv
IHRoZSBjb21tZW50cy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
