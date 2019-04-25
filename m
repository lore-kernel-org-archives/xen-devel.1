From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH 1/2] xen/domain: Block more speculative
 out-of-bound accesses
Date: Thu, 25 Apr 2019 10:04:56 +0200
Message-ID: <bfae92ab-91c8-b8ca-097b-94c4368ed743@amazon.de>
References: <1556129458-11418-1-git-send-email-andrew.cooper3@citrix.com>
 <1556129458-11418-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CmWH=S3=amazon.de=prvs=0115fdd92=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hJZNW-00046m-JP
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 08:05:10 +0000
In-Reply-To: <1556129458-11418-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yNC8xOSAyMDoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBjL3MgZjgzMDM0NTggcmVz
dHJpY3RlZCBzcGVjdWxhdGl2ZSBhY2Nlc3MgZm9yIGRvX3ZjcHVfb3AoKSwgYnV0IG5lZ2xlY3Rl
ZCBpdHMKPiBjb21wYXQgY291bnRlcnBhcnQsIHdoaWNoIGlzIHJlYWNoYWJsZSBieSBndWVzdHMg
dXNpbmcgdGhlIDMyYml0IEFCSS4KPgo+IE1ha2UgYW4gaWRlbnRpY2FsIGFkanVzdG1lbnQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gLS0t
Cj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogTm9yYmVydCBN
YW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gLS0tCj4gIHhlbi9jb21tb24vY29tcGF0L2Rv
bWFpbi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NvbXBhdC9kb21haW4uYyBiL3hlbi9j
b21tb24vY29tcGF0L2RvbWFpbi5jCj4gaW5kZXggODhiZmRjOC4uMzk4NzdiMyAxMDA2NDQKPiAt
LS0gYS94ZW4vY29tbW9uL2NvbXBhdC9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vY29tcGF0
L2RvbWFpbi5jCj4gQEAgLTM5LDcgKzM5LDcgQEAgaW50IGNvbXBhdF92Y3B1X29wKGludCBjbWQs
IHVuc2lnbmVkIGludCB2Y3B1aWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXIKPiAg
ICAgIHN0cnVjdCB2Y3B1ICp2Owo+ICAgICAgaW50IHJjID0gMDsKPiAgCj4gLSAgICBpZiAoIHZj
cHVpZCA+PSBkLT5tYXhfdmNwdXMgfHwgKHYgPSBkLT52Y3B1W3ZjcHVpZF0pID09IE5VTEwgKQo+
ICsgICAgaWYgKCAodiA9IGRvbWFpbl92Y3B1KGQsIHZjcHVpZCkpID09IE5VTEwgKQo+ICAgICAg
ICAgIHJldHVybiAtRU5PRU5UOwo+ICAKPiAgICAgIHN3aXRjaCAoIGNtZCApCgoKCgpBbWF6b24g
RGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJs
aW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gK
VXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
