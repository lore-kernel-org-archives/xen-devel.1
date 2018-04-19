From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] x86: Fix possible ASSERT(cpu <
 nr_cpu_ids)
Date: Thu, 19 Apr 2018 06:10:11 -0600
Message-ID: <5AD8872302000078001BCA98@prv1-mh.provo.novell.com>
References: <1524133246-3196-1-git-send-email-Davidwang@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nblc=hi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f98O8-0008CO-AW
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 12:10:08 +0000
In-Reply-To: <1524133246-3196-1-git-send-email-Davidwang@zhaoxin.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Davidwang <Davidwang@zhaoxin.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, "Fiona Li(BJ-RD)" <FionaLi@zhaoxin.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA0LjE4IGF0IDEyOjIwLCA8RGF2aWR3YW5nQHpoYW94aW4uY29tPiB3cm90ZToK
PiBGcm9tOiBEYXZpZCBXYW5nIDxkYXZpZHdhbmdAemhhb3hpbi5jb20+Cj4gCj4gQ1BVcyBtYXkg
c2hhcmUgYW4gaW4tdXNlIGNoYW5uZWwuIEhlbmNlIGNsZWFyaW5nIG9mIGEgYml0IGZyb20KPiB0
aGUgY3B1bWFzayAoaW4gaHBldF9icm9hZGNhc3RfZXhpdCgpKSBhcyB3ZWxsIGFzIHNldHRpbmcg
b25lCj4gKGluIGhwZXRfYnJvYWRjYXN0X2VudGVyKCkpIG11c3Qgbm90IHJhY2UgZXZhbHVhdGlv
biBvZiB0aGF0IHNhbWUKPiBjcHVtYXNrLiBUaGVyZWZvcmUgYXZvaWQgZXZhbHVhdGluZyB0aGUg
Y3B1bWFzayB0d2ljZSBpbgo+IGhwZXRfZGV0YWNoX2NoYW5uZWwoKS4gT3RoZXJ3aXNlIGNwdW1h
c2tfZW1wdHkoKSBtYXkgZS5nLnJldHVybgo+IGZhbHNlIHdoaWxlIHRoZSBzdWJzZXF1ZW50IGNw
dW1hc2tfZmlyc3QoKSBjb3VsZCByZXR1cm4gbnJfY3B1X2lkcywKPiB3aGljaCB0aGVuIHRyaWdn
ZXJzIHRoZSBhc3NlcnRpb24gaW4gY3B1bWFza19vZigpIHJlYWNoZWQgdGhyb3VnaAo+IHNldF9j
aGFubmVsX2lycV9hZmZpbml0eSgpLgo+IAo+IFNpZ24tb2ZmLWJ5OiBEYXZpZCBXYW5nIDxkYXZp
ZHdhbmdAemhhb3hpbi5jb20+CgpTaWduZWQtb2ZmLWJ5Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
cGV0LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHBldC5jCj4gQEAgLTUwOSwxNSArNTA5LDE4IEBA
IHN0YXRpYyB2b2lkIGhwZXRfYXR0YWNoX2NoYW5uZWwodW5zaWduZWQgaW50IGNwdSwKPiAgc3Rh
dGljIHZvaWQgaHBldF9kZXRhY2hfY2hhbm5lbCh1bnNpZ25lZCBpbnQgY3B1LAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBocGV0X2V2ZW50X2NoYW5uZWwgKmNoKQo+
ICB7Cj4gKyAgICB1bnNpZ25lZCBpbnQgbmV4dDsKPiArCj4gICAgICBzcGluX2xvY2tfaXJxKCZj
aC0+bG9jayk7Cj4gIAo+ICAgICAgQVNTRVJUKGNoID09IHBlcl9jcHUoY3B1X2JjX2NoYW5uZWws
IGNwdSkpOwo+ICAKPiAgICAgIHBlcl9jcHUoY3B1X2JjX2NoYW5uZWwsIGNwdSkgPSBOVUxMOwo+
ICsgICAgbmV4dCA9IGNwdW1hc2tfZmlyc3QoY2gtPmNwdW1hc2spOwo+ICAKPiAgICAgIGlmICgg
Y3B1ICE9IGNoLT5jcHUgKQo+ICAgICAgICAgIHNwaW5fdW5sb2NrX2lycSgmY2gtPmxvY2spOwo+
IC0gICAgZWxzZSBpZiAoIGNwdW1hc2tfZW1wdHkoY2gtPmNwdW1hc2spICkKPiArICAgIGVsc2Ug
aWYgKCBuZXh0ID09IG5yX2NwdV9pZHMgKQoKVGhpcyBzaG91bGQgYmUgPj0gLgoKQWxzbyBJJ2Qg
cHJlZmVyIGlmIHRoZSBjcHVtYXNrX2ZpcnN0KCkgd2FzIGF2b2lkZWQgaW4gdGhlIGNwdSAhPSBj
aC0+Y3B1CmNhc2UuCgpXaXRoIHRoZXNlClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CihhbmQgdGhlIGNoYW5nZXMgYXJlIGVhc3kgZW5vdWdoIHRvIG1ha2Ugd2hp
bGUgY29tbWl0dGluZykKCkFsc28gQ2MgSsO8cmdlbi4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
