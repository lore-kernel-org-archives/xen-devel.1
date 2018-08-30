From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/grant: Mute gcc warning in
 steal_linear_address()
Date: Thu, 30 Aug 2018 02:04:06 -0600
Message-ID: <5B87A4F602000078001E35FF@prv1-mh.provo.novell.com>
References: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDA2OjA2LCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gTW92ZSByZWZlcmVuY2Ugb2Ygb2wxZSBhaGVhZCBvciBlbHNlIHdlIHNlZSBiZWxvdyB3
YXJuaW5nLgo+IAo+IGNjMTogd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiBncmFu
dF90YWJsZS5jOiBJbiBmdW5jdGlvbiAncmVwbGFjZV9ncmFudF9wdl9tYXBwaW5nJzoKPiBncmFu
dF90YWJsZS5jOjE0Mjogd2FybmluZzogJ29sMWUubDEnIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6
ZWQgaW4gdGhpcyAKPiBmdW5jdGlvbgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFu
IDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgoKSSdtIGZpbmUgd2l0aCB0aGUgY2hhbmdlLCBi
dXQgZ29pbmcgZm9yd2FyZCBwbGVhc2UgYmUgbW9yZSBzcGVjaWZpYwp3aXRoIHlvdXIgZGVzY3Jp
cHRpb25zOiBXaGV0aGVyIG9yIG5vdCB3YXJuaW5ncyBnZXQgZW1pdHRlZCBmb3IgYQpjZXJ0YWlu
IHBpZWNlIG9mIGNvZGUgb2Z0ZW4gaGlnaGx5IGRlcGVuZHMgb24gY29tcGlsZXIgdmVyc2lvbi4g
TGV0CnVzIGtub3cgd2hpY2ggdmVyc2lvbiB5b3UndmUgcnVuIHRoaXMgaW50byB3aXRoLiBGb3Ig
dGhlIHJlY29yZCwgSSdtCmJ1aWxkaW5nIG9uIGEgd2lkZSByYW5nZSBvZiBnY2MgdmVyc2lvbnMg
ZXZlcnkgb25jZSBpbiBhIHdoaWxlLCBhbmQKSSd2ZSBub3QgY29tZSBhY3Jvc3MgdGhpcyB3YXJu
aW5nIHNvIGZhciAob3IgZWxzZSBJIHdvdWxkIGhhdmUgc2VudAphIHBhdGNoKS4gVGhlIHJlYWxs
eSBvbGQgdmVyc2lvbnMgKDQuMS54IGZvciBleGFtcGxlKSBjYW4ndCByZWFsbHkgYmUKdXNlZCBh
bnltb3JlIGZvciBjZXJ0YWluIG90aGVyIHJlYXNvbnMgYW55d2F5LCBhbmQgSSB0aGluayBpdCdz
CmFib3V0IHRpbWUgd2UgYXQgbGVhc3QgcmFpc2UgdGhlIGJhciBhIGxpdHRsZSAoYWxzbyBmb3Ig
YmludXRpbHMsIHdoaWNoCmlpcmMgd2FzIHRoZSBhY3R1YWwgcHJvYmxlbSB3aXRoIGhlcmUsIHVz
aW5nIGEgdmVyc2lvbiBtYXRjaGluZyBpbgpvcmlnaW5hbCByZWxlYXNlIHRpbWUgd2l0aCBnY2Mg
NC4xLngpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
