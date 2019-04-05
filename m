From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2] x86: don't allow clearing of
 TF_kernel_mode for other than 64-bit PV
Date: Fri, 05 Apr 2019 02:12:22 -0600
Message-ID: <5CA70DE60200007800224CA3@prv1-mh.provo.novell.com>
References: <5C868ED8020000780021D5BB@prv1-mh.provo.novell.com>
 <0ce9d1f8-ca58-3f81-4975-7a70f5ab669f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCJxZ-0008M3-BW
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 08:12:25 +0000
In-Reply-To: <0ce9d1f8-ca58-3f81-4975-7a70f5ab669f@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE5IGF0IDE4OjAxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAzLzExLzE5IDQ6MzcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGUgZmxhZyBp
cyByZWFsbHkgb25seSBtZWFudCBmb3IgdGhvc2UsIGJvdGggSFZNIGFuZCAzMi1iaXQgUFYgdGVs
bAo+PiBrZXJuZWwgZnJvbSB1c2VyIG1vZGUgYmFzZWQgb24gQ1BML1JQTC4gUmVtb3ZlIHRoZSBh
bGwtcXVlc3Rpb24tbWFya3MKPj4gY29tbWVudCBhbmQgbGV0J3MgYmUgb24gdGhlIHNhZmUgc2lk
ZSBoZXJlIGFuZCBhbHNvIHN1cHByZXNzIGNsZWFyaW5nCj4+IGZvciAzMi1iaXQgUFYgKHRoaXMg
aXNuJ3QgYSBmYXN0IHBhdGggYWZ0ZXIgYWxsKS4KPj4gCj4+IFJlbW92ZSBubyBsb25nZXIgbmVj
ZXNzYXJ5IGlzX3B2XzMyYml0XyooKSBmcm9tIHNoX3VwZGF0ZV9jcjMoKSBhbmQKPj4gc2hfd2Fs
a19ndWVzdF90YWJsZXMoKS4gTm90ZSB0aGF0IHNoYWRvd19vbmVfYml0X2Rpc2FibGUoKSBhbHJl
YWR5Cj4+IGFzc3VtZXMgdGhlIG5ldyBiZWhhdmlvci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKV2hpbGUgSSBpbnRlbmQgdG8gdGFrZSBHZW9y
Z2UncyBhY2sgYXMgYmVpbmcgc3VmZmljaWVudCB0byBjb3Zlcgp0aGUgc2hhZG93IHNpZGUsIG1h
eSBJIHBsZWFzZSBhc2sgZm9yIGFuIGFjayBvciBvdGhlcndpc2UgZm9yCnRoZSBub24tbW0gcGFy
dCBvZiB0aGUgY2hhbmdlPyBJIGtub3cgeW91J3ZlIG5vdCBiZWVuIGluIGZ1bGwKYWdyZWVtZW50
IHdpdGggdGhlIGNoYW5nZSwgYnV0IGlpcmMgSSd2ZSBuZXZlciBoZWFyZCBiYWNrIG9uIGEKc3Vi
c2VxdWVudCByZXBseSBvZiBtaW5lLiBBbmQgSSBmdXJ0aGVyIHRoaW5rIHRoYXQgd2l0aCB0aGUg
bm93Cih2MikgZXZlbiBtb3JlIG9idmlvdXMgZGVwZW5kZW5jeSBvZiB0aGUgc2hhZG93IGNvZGUg
b24KdGhpcyBiZWhhdmlvciwgdGhlIGNoYW5nZSBzaG91bGQgcmVhbGx5IGJlIHRha2VuIGFzIGlz
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
