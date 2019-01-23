From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12] xen/arm: gic: Make sure the number
 of interrupt lines is valid before using it
Date: Wed, 23 Jan 2019 13:29:16 +0000
Message-ID: <185cfa6d-81be-b7b6-c9eb-5a420159a4d7@arm.com>
References: <20181130171533.18123-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1901221520260.17936@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmIap-0003sJ-Py
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:29:23 +0000
In-Reply-To: <alpine.DEB.2.10.1901221520260.17936@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Jan-Peter Larsson <Jan-Peter.Larsson@arm.com>, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

KCsgSnVlcmdlbikKCkhpIEp1ZXJnZW4sCgpPbiAyMi8wMS8yMDE5IDIzOjIyLCBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JvdGU6Cj4gT24gRnJpLCAzMCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+PiBHSUN2MiBhbmQgR0lDdjMgc3VwcG9ydHMgdXAgdG8gMTAyMCBpbnRlcnJ1cHRzLiBIb3dl
dmVyLCB0aGUgdmFsdWUgY29tcHV0ZWQKPj4gZnJvbSBHSUNEX1RZUEVSLklUTGluZXNOdW1iZXIg
Y2FuIGJlIHVwIHRvIDEwMjQuIE9uIEdJQ3YzLCB3ZSB3aWxsIGVuZCB1cCB0bwo+PiB3cml0ZSBp
biByZXNlcnZlZCByZWdpc3RlcnMgdGhhdCBhcmUgcmlnaHQgYWZ0ZXIgdGhlIElST1VURVJzIG9u
ZSBhcyB0aGUKPj4gdmFsdWUgaXMgbm90IGNhcHBlZCBlYXJseSBlbm91Z2guCj4+Cj4+IENhcCB0
aGUgbnVtYmVyIG9mIGludGVycnVwdHMgYXMgc29vbiBhcyB3ZSBjb21wdXRlIGl0IHNvIHdlIGtu
b3cgd2UgY2FuCj4+IHNhZmVseSB1c2luZyBpdCBhZnRlcndhcmRzLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBSZXBvcnRlZC1ieTog
SmFuLVBldGVyIExhcnNzb24gPEphbi1QZXRlci5MYXJzc29uQGFybS5jb20+Cj4gCj4gUmV2aWV3
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCldvdWxk
IGl0IGJlIHBvc3NpYmxlIHRvIGdpdmUgYW4gUkFCIGZvciB0aGlzIHBhdGNoPwoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
