From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 36/45] x86: make loading of GDT at
 context switch more modular
Date: Thu, 16 May 2019 14:52:45 +0200
Message-ID: <3cbc2ca3-2aaf-d5ed-ab8b-0334485eb4f7@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-37-jgross@suse.com> <5CDD57DB020000780022FA5E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRFsO-00037K-DZ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:52:48 +0000
In-Reply-To: <5CDD57DB020000780022FA5E@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMjAxOSAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
ZG9tYWluLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IEBAIC0xNjE5LDYgKzE2
MTksMzcgQEAgc3RhdGljIGlubGluZSBib29sIG5lZWRfZnVsbF9nZHQoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkKPj4gICAgICByZXR1cm4gaXNfcHZfZG9tYWluKGQpICYmICFpc19pZGxlX2RvbWFp
bihkKTsKPj4gIH0KPj4gIAo+PiArc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX2Z1bGxfZ2R0X3B0
ZXMoc2VnX2Rlc2NfdCAqZ2R0LCBzdHJ1Y3QgdmNwdSAqdikKPj4gK3sKPj4gKyAgICB1bnNpZ25l
ZCBsb25nIG1mbiA9IHZpcnRfdG9fbWZuKGdkdCk7Cj4+ICsgICAgbDFfcGdlbnRyeV90ICpwbDFl
ID0gcHZfZ2R0X3B0ZXModik7Cj4+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4+ICsKPj4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IE5SX1JFU0VSVkVEX0dEVF9QQUdFUzsgaSsrICkKPj4gKyAgICAgICAg
bDFlX3dyaXRlKHBsMWUgKyBGSVJTVF9SRVNFUlZFRF9HRFRfUEFHRSArIGksCj4+ICsgICAgICAg
ICAgICAgICAgICBsMWVfZnJvbV9wZm4obWZuICsgaSwgX19QQUdFX0hZUEVSVklTT1JfUlcpKTsK
Pj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSB2b2lkIGxvYWRfZnVsbF9nZHQoc3RydWN0IHZj
cHUgKnYsIHVuc2lnbmVkIGludCBjcHUpCj4+ICt7Cj4+ICsgICAgc3RydWN0IGRlc2NfcHRyIGdk
dF9kZXNjOwo+PiArCj4+ICsgICAgZ2R0X2Rlc2MubGltaXQgPSBMQVNUX1JFU0VSVkVEX0dEVF9C
WVRFOwo+PiArICAgIGdkdF9kZXNjLmJhc2UgPSBHRFRfVklSVF9TVEFSVCh2KTsKPiAKPiBNYWtl
IHRoaXMgYW5kIC4uLgo+IAo+PiArICAgIGxnZHQoJmdkdF9kZXNjKTsKPj4gK30KPj4gKwo+PiAr
c3RhdGljIGlubGluZSB2b2lkIGxvYWRfZGVmYXVsdF9nZHQoc2VnX2Rlc2NfdCAqZ2R0LCB1bnNp
Z25lZCBpbnQgY3B1KQo+PiArewo+PiArICAgIHN0cnVjdCBkZXNjX3B0ciBnZHRfZGVzYzsKPj4g
Kwo+PiArICAgIGdkdF9kZXNjLmxpbWl0ID0gTEFTVF9SRVNFUlZFRF9HRFRfQllURTsKPj4gKyAg
ICBnZHRfZGVzYy5iYXNlICA9ICh1bnNpZ25lZCBsb25nKShnZHQgLSBGSVJTVF9SRVNFUlZFRF9H
RFRfRU5UUlkpOwo+IAo+IC4uLiB0aGUgdmFyaWFibGVzJyBpbml0aWFsaXplcnM/IFdpdGggdGhp
cyBhbmQgd2l0aCBjb25zdCBzdWl0YWJseQo+IGFwcGxpZWQgdG8gYWxsIGZ1bmN0aW9uIHBhcmFt
ZXRlcnMgd2hlcmUgdGhpcyBpcyBwb3NzaWJsZQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpUaGFua3MsIHdpbGwgZG8uCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
