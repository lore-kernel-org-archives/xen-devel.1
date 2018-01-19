From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC 07/11] Add kernel helper functions
Date: Fri, 19 Jan 2018 02:33:33 -0700
Message-ID: <5A61C97D02000078001A03E0@prv-mh.provo.novell.com>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-8-manish.jaggi@linaro.org>
 <757dcb74-5976-f5b2-6313-aea908de4335@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mpbx=eo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ecT3M-0004Bs-Ru
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 09:33:40 +0000
In-Reply-To: <757dcb74-5976-f5b2-6313-aea908de4335@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, manish.jaggi@linaro.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, andre.przywara@linaro.org, manish.jaggi@cavium.com, sameer.goel@linaro.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDE5OjU1LCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+IE9uIDAyLzAxLzE4IDA5OjI4LCBtYW5pc2guamFnZ2lAbGluYXJvLm9yZyB3cm90ZToKPj4g
RnJvbTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAbGluYXJvLm9yZz4KPj4gCj4+IEFkZCBr
YWxsb2Mga2ZyZWUgZnVuY3Rpb25zIGZyb20gbGludXgga2VybmVsLgo+IAo+IFRoaXMgZG9lcyBu
b3QgZGVzY3JpcHRpb24gYWxsIHRoZSBmdW5jdGlvbnMgeW91IGFkZGVkLiBCdXQgSSBhbSByZWFs
bHkgCj4gbm90IGNvbnZpbmNlZCB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSB0byBkbyB0aGF0Lgo+
IAo+IFRoaXMgZmlsZSBpcyBpbmNsdWRlZCBpbiBtYW55IHBsYWNlcyB0aGF0IHNob3VsZCBub3Qg
dXNlIGttYWxsb2MgJiBjbyAKPiBidXQgaW5zdGVhZCBYZW4gdmVyc2lvbi4KPiAKPiBJZiB5b3Ug
c3RpbGwgd2FudCB0byBhZGQgaXQgaW4gYW4gaGVhZGVyLCBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ug
c2Vuc2UgdG8gCj4gY3JlYXRlIGEgaGVhZGVyIHRoYXQgd2lsbCBjb250YWluIGxpbnV4aXNtLiBT
byBpdCBnZXQgaW5jbHVkZWQgb25seSAKPiB3aGVyZSBpdCBpcyBuZWVkZWQuCgpJbmRlZWQgLSBp
ZiB3ZSB3YW50IHN1Y2ggaGVscGVycyBhdCBhbGwsIHRoZXkgc2hvdWxkIGJlIG1hZGUgYXMKaW52
aXNpYmxlIHRvIGFueSB1bnJlbGF0ZWQgY29kZSBhcyBwb3NzaWJsZS4gU2luY2UgTGludXggc291
cmNlcwpjYW4ndCBub3JtYWxseSBiZSBpbXBvcnRlZCB2ZXJiYXRpbSBhbnl3YXksIGl0IG1heSBi
ZSBiZXN0IHRvCmhhdmUgc3VjaCBoZWxwZXJzIG5lYXIgdGhlIHRvIG9mIGFmZmVjdGVkIC5jIGZp
bGVzLCByZXN0cmljdGVkIHRvCmp1c3QgdGhlIGhlbHBlcnMgdGhhdCBhcmUgYWN0dWFsbHkgbmVl
ZGVkIGluIGVhY2ggaW5kaXZpZHVhbCBmaWxlLgpPbmx5IGlmIHRoaXMgcmVzdWx0cyBpbiBtZWFu
aW5nZnVsIGR1cGxpY2F0aW9uIEkgd291bGQgY29uc2lkZXIgaXQKcmVhc29uYWJsZSB0byBpbnRy
b2R1Y2UgYSBoZWxwZXIgaGVhZGVyLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
