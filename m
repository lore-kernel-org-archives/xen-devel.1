From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] docs: Introduce some hypercall page
 documentation
Date: Wed, 29 May 2019 02:45:12 -0600
Message-ID: <5CEE469802000078002334FE@prv1-mh.provo.novell.com>
References: <1558606816-17842-3-git-send-email-andrew.cooper3@citrix.com>
 <1559103029-27912-1-git-send-email-andrew.cooper3@citrix.com>
 <EF573A6C020000F58E2C01CD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVuD2-0003tc-2U
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 08:45:20 +0000
In-Reply-To: <EF573A6C020000F58E2C01CD@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA1LjE5IGF0IDA2OjEwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBhbHNvIGludHJvZHVjZWQgdGhlIHRvcC1sZXZlbCBHdWVzdCBEb2N1bWVudGF0
aW9uIHNlY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CndpdGggb25lIGZ1cnRoZXIgcmVtYXJrIC8gcXVlc3Rpb246Cgo+ICtIeXBlcmNhbGwgUGFn
ZQo+ICs9PT09PT09PT09PT09PQo+ICsKPiArVGhlIGh5cGVyY2FsbCBwYWdlIGlzIGEgcGFnZSBv
ZiBndWVzdCBSQU0gaW50byB3aGljaCBYZW4gd2lsbCB3cml0ZSBzdWl0YWJsZQo+ICt0cmFuc2Zl
ciBzdHVicy4KPiArCj4gK0NyZWF0aW5nIGEgaHlwZXJjYWxsIHBhZ2UgaXMgYW4gaXNvbGF0ZWQg
b3BlcmF0aW9uIGZyb20gWGVuJ3MgcG9pbnQgb2Ygdmlldy4KPiArSXQgaXMgdGhlIGd1ZXN0cyBy
ZXNwb25zaWJpbGl0eSB0byBlbnN1cmUgdGhhdCB0aGUgaHlwZXJjYWxsIHBhZ2UsIG9uY2UKPiAr
d3JpdHRlbiBieSBYZW4sIGlzIG1hcHBlZCB3aXRoIGV4ZWN1dGFibGUgcGVybWlzc2lvbnMgc28g
aXQgbWF5IGJlIHVzZWQuCj4gK011bHRpcGxlIGh5cGVyY2FsbCBwYWdlcyBtYXkgYmUgY3JlYXRl
ZCBieSB0aGUgZ3Vlc3QsIGlmIGl0IHdpc2hlcy4KPiArCj4gK1RoZSBzdHVicyBhcmUgYXJyYW5n
ZWQgYnkgaHlwZXJjYWxsIGluZGV4LCBhbmQgc3RhcnQgb24gMzItYnl0ZSBib3VuZGFyaWVzLgo+
ICtUbyBpbnZva2UgYSBzcGVjaWZpYyBoeXBlcmNhbGwsIGBgY2FsbGBgIHRoZSByZWxldmFudCBz
dHViIFszXV86Cj4gKwo+ICsuLiBjb2RlLWJsb2NrOjogbm9uZQo+ICsKPiArICBjYWxsIGh5cGVy
Y2FsbF9wYWdlICsgaW5kZXggKiAzMgo+ICsKPiArVGhlcmUgcmVzdWx0IGlzIGFuIEFCSSB3aGlj
aCBpcyBpbnZhcmlhbnQgb2YgdGhlIGV4YWN0IG9wZXJhdGluZyBtb2RlIG9yCj4gK2hhcmR3YXJl
IHZlbmRvci4gIFRoaXMgaXMgaW50ZW5kZWQgdG8gc2ltcGxpZnkgZ3Vlc3Qga2VybmVsIGludGVy
ZmFjZXMgYnkKPiArYWJzdHJhY3RpbmcgYXdheSB0aGUgZGV0YWlscyBvZiBob3cgaXQgaXMgY3Vy
cmVudGx5IHJ1bm5pbmcuCgpJcyBpdCB3b3J0aCBtZW50aW9uaW5nIGhlcmUgdGhhdCBjZXJ0YWlu
IGFzcGVjdHMgb2YgdGhlIGh5cGVydmlzb3IgaW50ZXJmYWNlCihzaGFyZWQgZGF0YSBzdHJ1Y3R1
cmVzKSBhcmUgaW5mbHVlbmNlZCBieSB0aGUgbW9kZSB0aGUgZ3Vlc3QgaXMgaW4gYXQgdGhlCnRp
bWUgdGhlIG1vc3QgcmVjZW50IGh5cGVyY2FsbCBwYWdlIHJlZ2lzdHJhdGlvbiAob2RkbHkgZW5v
dWdoIGFsdGVybmF0aXZlbHkKdGhlIG1vc3QgcmVjZW50IHNldHRpbmcgb2YgSFZNX1BBUkFNX0NB
TExCQUNLX0lSUSkgaGFzIG9jY3VycmVkPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
