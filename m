From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 08/14] x86emul: add read-modify-write hook
Date: Thu, 15 Mar 2018 14:48:30 +0000
Message-ID: <5e8633af-aeb2-5f0c-bbf8-4d42f20f22bc@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7E7102000078001B228B@prv-mh.provo.novell.com>
 <485afda7-5918-2bfc-2bf4-c07b06d194de@citrix.com>
 <5AAA957002000078001B23CB@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewUJD-0007mt-Rr
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 14:56:47 +0000
In-Reply-To: <5AAA957002000078001B23CB@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTQ6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjAzLjE4IGF0
IDE1OjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE1LzAzLzE4
IDEzOjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEBAIC04NTE3LDYgKzg2OTAsMTQyIEBAIHg4
Nl9lbXVsYXRlKAo+Pj4gICN1bmRlZiB2ZXgKPj4+ICAjdW5kZWYgZWEKPj4+ICAKPj4+ICtpbnQg
eDg2X2VtdWxfcm13KAo+Pj4gKyAgICB2b2lkICpwdHIsCj4+PiArICAgIHVuc2lnbmVkIGludCBi
eXRlcywKPj4+ICsgICAgdWludDMyX3QgKmVmbGFncywKPj4+ICsgICAgc3RydWN0IHg4Nl9lbXVs
YXRlX3N0YXRlICpzdGF0ZSwKPj4+ICsgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQp
Cj4+PiArewo+Pj4gKyAgICB1bnNpZ25lZCBsb25nICpkc3QgPSBwdHI7Cj4+PiArCj4+PiArICAg
IEFTU0VSVChieXRlcyA9PSBzdGF0ZS0+b3BfYnl0ZXMpOwo+Pj4gKwo+Pj4gKyNpZmRlZiBfX3g4
Nl82NF9fCj4+PiArIyBkZWZpbmUgSkNYWiAianJjeHoiCj4+PiArI2Vsc2UKPj4+ICsjIGRlZmlu
ZSBKQ1haICJqZWN4eiIKPj4+ICsjZW5kaWYKPj4+ICsKPj4+ICsjZGVmaW5lIENPTkRfTE9DSyhv
cCkgXAo+Pj4gKyAgICBKQ1haICIgLkwiICNvcCAiJT1cblx0IiBcCj4+PiArICAgICJsb2NrXG4i
IFwKPj4+ICsgICAgIi5MIiAjb3AgIiU9OlxuXHQiIFwKPj4+ICsgICAgI29wCj4+IEknZCBmb3Jn
b3R0ZW4gdGhhdCB0aGVzZSBlbmNvZGluZyBvZiBqbXAgZXhpc3RlZCwgYnV0IHZhcmlvdXMgT1JN
cwo+PiBzdWdnZXN0IHRoYXQgaXQgaXMgZmFyIHNsb3dlciB0byBleGVjdXRlIHRoYW4gb3RoZXIg
anVtcHMuCj4+Cj4+IElycmVzcGVjdGl2ZSBvZiB0aGUgaW5zdHJ1Y3Rpb24gbGF0ZW5jeSBhcmd1
bWVudCwgeW91J2xsIGdldCBiZXR0ZXIgY29kZQo+PiBnZW5lcmF0aW9uIHdpdGggY29uZF9vcCgp
IGxvb2tpbmcgcmF0aGVyIG1vcmUgbGlrZToKPj4KPj4gY21wYiAkMCwgJVtsb2NrXQo+PiBqZSAx
Zgo+PiBsb2NrCj4+IDE6ICNvcAo+Pgo+PiB3aGljaCB3aWxsIG1vc3QgbGlrZWx5IGNhdXNlIHRo
ZSBjbXAgdG8gYmUgZW5jb2RlZCB3aXRoIGEgbWVtb3J5Cj4+IG9wZXJhbmQsIHJhdGhlciB0aGFu
IGZvcmNpbmcgaXQgdGhlIHZhbHVlIGludG8gJWVjeC4KPiBZb3UncmUgbWlzc2luZyB0aGUgbWFp
biBwb2ludCBvZiBoYXZpbmcgY2hvc2VuIEp7RSxSfUNYWiAoYXJndWFibHkKPiBJIHNob3VsZCBo
YXZlIGFkZGVkIGEgY29tbWVudCwgYW5kIEkgbm93IHdpbGwpOiBUaGlzIG9wZXJhdGlvbiBzaXRz
Cj4gaW5zaWRlIHRoZSByYW5nZSB3aGVyZSB3ZSBoYXZlIGxvYWRlZCBndWVzdCBFRkxBR1MgKHRo
ZSBzdGF0dXMKPiBvbmVzKSBpbnRvIHRoZSBoYXJkd2FyZSBFRkxBR1MgcmVnaXN0ZXIuIEZvciBB
REMsIFNCQiwgUkNMLCBhbmQKPiBSQ1IgdG8gZnVuY3Rpb24gd2UgbXVzdCBub3QgYWx0ZXIgQ0Yg
aGVyZSwgYW5kIGZvciBmbGFncyBub3QKPiBtb2RpZmllZCBieSBhbiBpbnNuIChlLmcuIGV2ZXJ5
dGhpbmcgb3RoZXIgdGhhbiBDRiBmb3IgQlQqKSB3ZQo+IG11c3Qgbm90IGFsdGVyIGFueSBvZiB0
aGUgb3RoZXIgc3RhdHVzIGZsYWdzLgoKQWggb2sgLSB2ZXJ5IGdvb2QganVzdGlmaWNhdGlvbi7C
oCBTdWJqZWN0IHRvIGEgc3VpdGFibGUgY29kZSBjb21tZW50LCBteQphY2sgc3RpbGwgc3RhbmRz
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
