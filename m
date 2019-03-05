From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF v8 9/9] common/grant_table: block
 speculative out-of-bound accesses
Date: Tue, 05 Mar 2019 05:27:56 -0700
Message-ID: <5C7E6B4C020000780021BA20@prv1-mh.provo.novell.com>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
 <1551101683-996-10-git-send-email-nmanthey@amazon.de>
 <5C741BF7020000780021A016@prv1-mh.provo.novell.com>
 <fc17de0e-d742-fa6b-a714-1f311c8adc67@amazon.de>
 <5C77B12E020000780021AF80@prv1-mh.provo.novell.com>
 <5640538d-32c1-ec4f-0c80-84b49fadb5fb@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M+W2=RI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h19Az-0006NJ-TD
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 12:28:05 +0000
In-Reply-To: <5640538d-32c1-ec4f-0c80-84b49fadb5fb@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAzLjE5IGF0IDA5OjE1LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAyLzI4LzE5IDExOjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjcuMDIuMTkgYXQg
MTQ6MDEsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gT24gMi8yNS8xOSAxNzo0Niwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gSSB3b3VsZCByZWFsbHkgbGlrZSB0byBhc2sgdGhhdCBJ
IChvciBzb21lb25lIGVsc2UpIGRvbid0IG5lZWQgdG8KPj4+PiBnbyB0aHJvdWdoIGFuZCBsaXN0
IHJlbWFpbmluZyB2ZXJzaW9uIGNoZWNrcyBhZ2FpbiAtIGFmdGVyIGFsbCBJCj4+Pj4gaGFkIGRv
bmUgc28gZm9yIHY2IGFscmVhZHksIGFuZCBJIGRpZG4ndCBnbyB0aHJvdWdoIGFsbCBvZiB0aGVt
Cj4+Pj4gYWdhaW4gZm9yIHY3IGFzc3VtaW5nIHRoYXQgeW91IHdvdWxkIGhhdmUgd29ya2VkIHRo
cm91Z2ggdGhlCj4+Pj4gZW50aXJlIHNldC4KPj4+IFNvLCBoZXJlIGlzIHRoZSBhbm5vdGF0aW9u
IGZvciBhbGwgb2YgdGhlbS4gQW55b25lIHRoYXQgSSBkaWQgbm90Cj4+PiBpbmNsdWRlIGluIHRo
ZSBsaXN0IGhhcyBiZWVuIGZpeGVkIGluIHByZXZpb3VzIHZlcnNpb25zLCBvciB3aWxsIGJlCj4+
PiBmaXhlZCBpbiB0aGUgbmV4dCB2ZXJzaW9uOgo+Pj4KPj4+IGdpdCBncmVwIC1ucCB2ZXJzaW9u
IGNvbW1vbi9ncmFudF90YWJsZS5jCj4+Pgo+Pj4gY29tbW9uL2dyYW50X3RhYmxlLmM6ODMxOnN0
YXRpYyBpbnQgX3NldF9zdGF0dXModW5zaWduZWQgZ3RfdmVyc2lvbiwKPj4+IGNvbW1vbi9ncmFu
dF90YWJsZS5jOjg0MDogICAgaWYgKCBndF92ZXJzaW9uID09IDEgKQo+Pj4KPj4+IC0+IEkgZG8g
bm90IHNlZSBob3cgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGhhcHBlbiBpbiB0aGUgY2FsbGVkIGZ1
bmN0aW9ucwo+Pj4gdGhlcmUuCj4+IEJvdGggZnVuY3Rpb25zIGdldCBzaGFoIHBhc3NlZCBpbnRv
IHRoZW0sIHdoaWNoIG1heSBwb2ludCB0byB0aGUKPj4gb3RoZXIgdmVyc2lvbidzIGxheW91dC4g
RWFybGllciBmZW5jZXMgZG9uJ3QgaGVscCBzcGVjdWxhdGlvbiBvbiB0aGlzCj4+IGNvbmRpdGlv
bmFsLgo+IFdoZW5ldmVyIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkLCB0aGUgc2hhaCBmaWVsZCBo
YXMgdGhlIHNhbWUgc3RydWN0dXJlCj4gZm9yIGJvdGggdmVyc2lvbnMuCgpCdXQgaXQgZG9lcyBt
YXR0ZXIgaG93IGl0IHdhcyBvYnRhaW5lZCwgZG9lc24ndCBpdD8gVGhlcmUncwpzaGFyZWRfcmF3
W10gaW52b2x2ZWQgaGVyZSBvbmNlIGFnYWluLiBIZW5jZSB3ZSdyZSBzYWZlIGhlcmUKb25seSBp
ZiB0aGUgY2FsbGVyIGhhcyBhbHJlYWR5IHN1aXRhYmx5IGd1YXJkZWQgYWdhaW5zdCBzcGVjdWxh
dGlvbi4KV2hpY2ggbWF5IGluZGVlZCBiZSB0aGUgY2FzZSwgYnV0IHdoaWNoIHRoZW4gbmVlZHMg
dG8gYmUgY2FsbGVkCm91dCBpbiB0aGUgZGVzY3JpcHRpb24uCgo+IFRoZSB2MiBncmFudCBlbnRy
eSBoYXMgYSBwbGFpbiBoZWFkZXIgaGRyLCB3aGljaCBpcwo+IHVzZWQgaGVyZSwgYW5kIHdoaWNo
IGlzIGZvcndhcmRlZCB0byB0aGUgc2V0X3N0YXR1cyBtZXRob2QuIEFub3RoZXIKPiBwcm9wZXJ0
eSB0aGF0IHdlIG5ldmVyIHRhbGtlZCBhYm91dCBoZXJlIGlzIHRoYXQgd2Ugb25seSBjYXJlIGFi
b3V0Cj4gY3Jvc3MgY2FjaGUtbGluZSBhY2Nlc3Nlcy4gQXMgc29vbiBhcyBhbnkgYnl0ZSBpcyB0
b3VjaGVkIG9uIGEgY2FjaGUKPiBsaW5lLCB0aGUgd2hvbGUgbGluZSBpcyBicm91Z2h0IGludG8g
dGhlIGNhY2hlLiBBcyB0aGUgY29kZSBhcm91bmQgdGhlCj4gc2V0X3N0YXR1cyBtZXRob2QgYWxy
ZWFkeSBwdWxscyBpbiB0aGUgY29ycmVzcG9uZGluZyBjYWNoZSBsaW5lLCB0aGF0Cj4gY29kZSBs
b29rcyBva2F5IHRvIG1lIGZyb20gYSBMMVRGIHBlcnNwZWN0aXZlLgoKU28gaGVyZSBhcyB3ZWxs
IGFzIGZvciB0aGUgb3RoZXIgcG9pbnRzIC0gaWYgeW91IGRlY2lkZSB0byBvbWl0IGd1YXJkaW5n
LApwbGVhc2UgZXhwbGFpbiB3aHkgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
