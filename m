From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 02/12] x86: don't use hypervisor
 stack size for dumping guest stacks
Date: Tue, 23 Jan 2018 03:11:56 -0700
Message-ID: <5A67187C02000078001A1742@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-3-jgross@suse.com>
 <5A670DEF02000078001A16AF@suse.com>
 <8e536a60-76bb-0738-64ec-e3fad7f710f3@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edvYf-0004Ak-MQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 10:12:01 +0000
In-Reply-To: <8e536a60-76bb-0738-64ec-e3fad7f710f3@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDEwOjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
My8wMS8xOCAxMDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIyLjAxLjE4IGF0IDEz
OjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IHNob3dfZ3Vlc3Rfc3RhY2soKSBhbmQg
Y29tcGF0X3Nob3dfZ3Vlc3Rfc3RhY2soKSBzdG9wIGR1bXBpbmcgdGhlCj4+PiBzdGFjayBvZiB0
aGUgZ3Vlc3Qgd2hlbmV2ZXIgaXRzIHZpcnR1YWwgYWRkcmVzcyByZWFjaGVzIHRoZSBzYW1lCj4+
PiBhbGlnbm1lbnQgd2hpY2ggaXMgdXNlZCBmb3IgdGhlIGh5cGVydmlzb3Igc3RhY2tzLgo+Pj4K
Pj4+IFJlbW92ZSB0aGlzIGFyYml0cmFyeSBsaW1pdCBhbmQgdHJ5IHRvIGR1bXAgYSBmaXhlZCBu
dW1iZXIgb2YgbGluZXMKPj4+IGluc3RlYWQuCj4+IAo+PiBIbW0sIEkgY2FuIHNlZSB5b3VyIHBv
aW50LCBidXQgYmVmb3JlIGxvb2tpbmcgYXQgdGhlIGNoYW5nZSBpbiBkZXRhaWwKPj4gSSB0aGlu
ayB3ZSBuZWVkIHRvIGFncmVlIG9uIHdoYXQgYmVoYXZpb3Igd2Ugd2FudC4gRHVtcGluZwo+PiBh
cmJpdHJhcnkgZGF0YSBhcyBpZiBpdCB3YXMgYSBwYXJ0IG9mIHRoZSBzdGFjayBpc24ndCB2ZXJ5
IGhlbHBmdWwsIGxpbWl0aW5nCj4+IHRoZSByaXNrIG9mIHdoaWNoIGlzLCBJIHRoaW5rLCB0aGUg
cmVhc29uIGZvciB0aGUgd2F5IHRoaW5ncyBjdXJyZW50bHkKPj4gd29yayAoYXNzdW1pbmcgdGhh
dCBndWVzdCBrZXJuZWxzIHdvbid0IGhhdmUgc3RhY2tzIGxhcmdlciB0aGFuIFhlbgo+PiBpdHNl
bGYsIGFuZCB0aGF0IHRoZXkgdG9vIHdvdWxkIGFsaWduIHRoZW0pLiBXaGF0IHdvdWxkIHBlcmhh
cHMgYmUKPj4gYmV0dGVyIGlzIGZvciB0aGUgZ3Vlc3QgdG8gc3VwcGx5IGluZm9ybWF0aW9uIGFi
b3V0IHRoZSByZXN0cmljdGlvbnMgaXQKPj4gZW5mb3JjZXMgb24gaXRzIHN0YWNrcywgd2hpY2gg
WGVuIGNvdWxkIHRoZW4gdXNlIGhlcmUuIEluIHRoZQo+PiBhYnNlbmNlIG9mIHN1Y2ggaGludHMg
dXNpbmcgdGhlIHZhbHVlcyBjdXJyZW50bHkgYmVpbmcgdXNlZCB3b3VsZAo+PiBwb3NzaWJseSBt
YWtlIHNlbnNlLgo+IAo+IEN1cnJlbnRseSB0aGUgc3RhY2sgZHVtcCB3aWxsIGhhdmUgdGhlIHNh
bWUgZml4ZWQgbnVtYmVyIG9mIGxpbmVzIGFzCj4gd2l0aCBteSBwYXRjaC4gSSdtIG9ubHkgcmVt
b3ZpbmcgdGhlIHByZW1hdHVyZSBlbmQgb2YgZHVtcGluZyB3aGVuZXZlcgo+IHRoZSBzdGFjayBh
ZGRyZXNzIGNyb3NzZXMgYSAzMmtCIGJvdW5kYXJ5LiBMaW51eCA2NCBiaXQgcHYgZ3Vlc3RzIGFy
ZQo+IHVzaW5nIDE2a0Igc3RhY2sgc2l6ZS4gU28gdXNpbmcgdGhpcyBib3VuZGFyeSB3b3VsZCBi
ZSBtb3JlIG5hdHVyYWwuCgpJT1cgeW91ciBjaGFuZ2UgY29udmVydHMgYSA1MDo1MCBjaGFuY2Ug
b2YgZHVtcGluZyBub24tc3RhY2sKZGF0YSB0byAxMDAlIChhbGwgaW4gY2FzZSB0aGUgc3RhY2sg
cG9pbnRlciBpc24ndCBmYXIgYXdheSBmcm9tIHRoZQpzdGFjayBzdGFydCkuCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
