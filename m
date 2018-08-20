From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] x86/pae: use 64 bit atomic xchg
 function in native_ptep_get_and_clear
Date: Mon, 20 Aug 2018 10:56:12 +0200
Message-ID: <a85dcc1f-4245-3c07-8d47-53b6c9ce12f9__39990.6987710439$1534755299$gmane$org@suse.com>
References: <20180820051456.20779-1-jgross@suse.com>
 <20180820051456.20779-3-jgross@suse.com>
 <5B7A7E6C02000078001DFD15@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vhn4=ld=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1frfyz-0005Z9-U9
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 08:56:17 +0000
In-Reply-To: <5B7A7E6C02000078001DFD15@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDgvMTggMTA6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjA4LjE4IGF0
IDA3OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTE0OCwxNCArMTUwLDE0IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBwdWRfY2xlYXIocHVkX3QgKnB1ZHApCj4+ICAjaWZkZWYgQ09O
RklHX1NNUAo+PiAgc3RhdGljIGlubGluZSBwdGVfdCBuYXRpdmVfcHRlcF9nZXRfYW5kX2NsZWFy
KHB0ZV90ICpwdGVwKQo+PiAgewo+PiAtCXB0ZV90IHJlczsKPj4gKwl1bmlvbiB7Cj4+ICsJCXB0
ZV90IHB0ZTsKPj4gKwkJbG9uZyBsb25nIHZhbDsKPj4gKwl9IHJlczsKPiAKPiBXaHkgdGhlIHVu
aW9uPyBwdGVfdCBhbHJlYWR5IGlzIG9uZSwgd2l0aCB0aGUgcHRlIGZpZWxkIGJlaW5nIHdoYXQK
PiB5b3UncmUgYWZ0ZXIgLi4uCj4gCj4+IC0JLyogeGNoZyBhY3RzIGFzIGEgYmFycmllciBiZWZv
cmUgdGhlIHNldHRpbmcgb2YgdGhlIGhpZ2ggYml0cyAqLwo+PiAtCXJlcy5wdGVfbG93ID0geGNo
ZygmcHRlcC0+cHRlX2xvdywgMCk7Cj4+IC0JcmVzLnB0ZV9oaWdoID0gcHRlcC0+cHRlX2hpZ2g7
Cj4+IC0JcHRlcC0+cHRlX2hpZ2ggPSAwOwo+PiArCXJlcy52YWwgPSBhcmNoX2F0b21pYzY0X3hj
aGcoKGF0b21pYzY0X3QgKilwdGVwLCAwKTsKPiAKPiAuLi4gaGVyZS4KClV1aCwgeWVzLgoKSSdt
IHdhaXRpbmcgZm9yIG1vcmUgY29tbWVudHMsIGVzcGVjaWFsbHkgcmVnYXJkaW5nIHRoZSBwb3Rl
bnRpYWwgbmVlZApmb3IgYSBwYXJhdmlydCBmdW5jdGlvbi4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
