From: Ian Jackson <ian.jackson@citrix.com>
Subject: Linux 3.18 no longer boots under Xen, Xen CI dropping it
Date: Wed, 29 May 2019 16:57:54 +0100
Message-ID: <23790.44034.186393.25330@mariner.uk.xensource.com>
References: <E1hSRQF-0006xk-BS@osstest.test-lab.xenproject.org>
 <23778.34168.78221.110803@mariner.uk.xensource.com>
 <20190520114147.GU2798@zion.uk.xensource.com>
 <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYmT=T5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hW0yF-0007Yy-OF
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 15:58:31 +0000
In-Reply-To: <5CE2B0DA0200007800230A08@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

TGludXggMy4xOCBubyBsb25nZXIgYm9vdHMgdW5kZXIgWGVuLgoKVGhpcyBoYXMgYmVlbiB0cnVl
IGZvciBvdmVyIGhhbGYgYSB5ZWFyLiAgVGhlIFhlbiBwcm9qZWN0IENJIGhhcyBiZWVuCnNlbmRp
bmcgYXV0b21hdGljIG1haWxzIGluY2x1ZGluZyBiaXNlY3Rpb24gcmVwb3J0cyAoc2VlIGJlbG93
KS4KSSBlbWFpbGVkIFhlbiBrZXJuZWwgZm9sa3MgYW5kIGdvdCBubyB0YWtlcnMgZm9yIGZpeGlu
ZyB0aGlzLgoKVW5sZXNzIHRoaXMgaXMgZml4ZWQgc29vbiwgb3IgYXQgbGVhc3Qgc29tZW9uZSBz
aG93cyBzb21lIGluY2xpbmF0aW9uCnRvIGludmVzdGlnYXRlIHRoaXMgcmVncmVzc2lvbiwgSSBp
bnRlbmQgdG8gZHJvcCBhbGwgdGVzdGluZyBvZiB0aGlzCiJzdGFibGUiIGJyYW5jaC4gIEl0IGhh
cyByb3R0ZWQgYW5kIG5vLW9uZSBpcyBmaXhpbmcgaXQuCgo+ID4+ID4gKioqIEZvdW5kIGFuZCBy
ZXByb2R1Y2VkIHByb2JsZW0gY2hhbmdlc2V0ICoqKgo+ID4+ID4gCj4gPj4gPiAgIEJ1ZyBpcyBp
biB0cmVlOiAgbGludXggCj4gPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS5naXQKPiA+PiA+ICAgQnVnIGludHJvZHVjZWQ6
ICA2YjFhZTUyN2IxZmRlZTg2ZTgxZGEwY2IyNmNlZDc1NzMxYzZjMGZhCj4gPj4gPiAgIEJ1ZyBu
b3QgcHJlc2VudDogYmE2OTg0ZmMwMTYyZjI0YTUxMGViYzM0ZTg4MWI1NDZiNjljNTUzYgo+ID4+
ID4gICBMYXN0IGZhaWwgcmVwcm86IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3Jn
L29zc3Rlc3QvbG9ncy8xMzY1NzQvIAo+ID4gCj4gPiBJdCBzZWVtcyB0aGF0IHRoZXJlIGlzIHNv
bWV0aGluZyB3cm9uZyB3aXRoIHRoZSBJR0IgZHJpdmVyLgoKQWRkaXRpb25hbGx5LCBKYW4gQmV1
bGljaCB3cml0ZXM6Cj4gV2hpY2ggaW4gdHVybiByZW1pbmRzIG1lIG9mIGEgcGF0Y2ggb2YgbWlu
ZSB0aGF0IHdhcyBiYWNrcG9ydGVkCj4gKGFuZCBzcG90dGVkIGJ5IGFuIGVhcmxpZXIgYmlzZWN0
aW9uKSwgYW5kIHRoYXQgSSd2ZSBzdWdnZXN0ZWQKPiAodHdpY2UgYWxyZWFkeSBpaXJjKSB3YXMg
ZWl0aGVyIGJhY2twb3J0ZWQgaW4gZXJyb3IsIG9yIHdpdGhvdXQgc29tZQo+IGZ1cnRoZXIgbmVj
ZXNzYXJ5IGNoYW5nZXMuIElpcmMgdGhlIHN0YWJsZSB0cmVlIG1haW50YWluZXIgZm9yIHRoYXQK
PiBicmFuY2ggd2FzIENjLWVkIGJhY2sgdGhlbiwgYW5kIGlmIHNvIEknZCBjb25jbHVkZSBoZSBk
b2Vzbid0IGNhcmUuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
