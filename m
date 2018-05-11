From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] viridian: fix cpuid leaf 0x40000003
Date: Fri, 11 May 2018 17:18:48 +0100
Message-ID: <2ce9b3ae-9bc5-801a-b899-3c7aab435b1d@citrix.com>
References: <1526050112-9576-1-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9qf6=h6=citrix.com=prvs=6620dc017=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fHAku-0006tr-CP
 for xen-devel@lists.xenproject.org; Fri, 11 May 2018 16:18:52 +0000
In-Reply-To: <1526050112-9576-1-git-send-email-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <JGross@suse.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDUvMTggMTU6NDgsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGUgcmVzcG9uc2UgdG8g
dmlyaWRpYW4gbGVhZiAzIG5lZWRzIHRvIHNwbGl0IGEgNjQtYml0IG1hc2sgYWNyb3NzIEVBWCBh
bmQKPiBFQlgsIHdpdGggdGhlIGxvdyBvcmRlciAzMiBiaXRzIGluIEVBWCBhbmQgdGhlIGhpZ2gg
b3JkZXIgMzIgYml0cyBpbiBFQlguCj4gVG8gZmFjaWxpdGF0ZSB0aGlzIGEgdW5pb24gb2YgdHdv
IHVpbnQzMl90IHZhbHVlcyBhbmQgdGhlIG1hc2sgKHR5cGUKPiBIVl9QQVJUSVRJT05fUFJJVklM
RUdFX01BU0spIGlzIGFsbG9jYXRlZCBvbiBzdGFjayBhcyBmb2xsb3dzOgo+Cj4gdW5pb24gewo+
ICAgICBIVl9QQVJUSVRJT05fUFJJVklMRUdFX01BU0sgbWFzazsKPiAgICAgdWludDMyX3QgbG8s
IGhpOwo+IH0gdTsKPgo+IFRoaXMsIG9mIGNvdXJzZSwgaXMgaW5jb3JyZWN0IGFzIGJvdGggbG8g
YW5kIGhpIHdpbGwgYWxpYXMgdGhlIGxvdyBvcmRlcgo+IDMyIGJpdHMgb2YgdGhlIG1hc2suCj4K
PiBUaGlzIHBhdGNoIHdyYXBzIGxvIGFuZCBoaSBpbiBhbiBhbm9ubXltb3VzIHN0cnVjdCB0byBh
Y2hpZXZlIHRoZSBkZXNpcmVkCj4gZWZmZWN0Lgo+Cj4gTk9URTogRml4aW5nIHRoaXMgYWxzbyBz
dG9wcyBXaW5kb3dzIG1ha2luZyB0aGUgSHZHZXRQYXJ0aXRpb25JZCBoeXBlcmNhbGwKPiAgICAg
ICB3aGljaCB3YXMgcHJldmlvdXNseSBjb25zaWRlcmVkIGVycm9uZW91cyBiZWhhdmlvdXIuIFRo
dXMgdGhlCj4gICAgICAgaHlwZXJjYWxsIGhhbmRsZXIgaXMgYWxzbyBtb2RpZmllZCB0byBzdG9w
IHNxdWFzaGluZyB0aGUKPiAgICAgICAndW5pbXBsZW1lbnRlZCcgd2FybmluZyBmb3IgdGhpcyBo
eXBlcmNhbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpDQyBKdWVyZ2VuLsKgIFRoaXMgd2FudHMgYmFja3BvcnRpbmcsIGFuZCB0YWtpbmcg
aW50byA0LjExCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
