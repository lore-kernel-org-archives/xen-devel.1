From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Question about making system thread like kthread in
 Linux kernel
Date: Tue, 11 Dec 2018 13:19:38 +0000
Message-ID: <20181211131938.i2jxxdeyuizxpgvc@zion.uk.xensource.com>
References: <CAFX_q-Go=NXvmRyd9aHC_FVcZjCxa=fG60KPq03kMGJ13Y5yAg@mail.gmail.com>
 <20181211131706.l23mh6wzzenxixwf@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DjN1=OU=citrix.com=prvs=8762858e5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gWhwt-0005MT-5H
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 13:19:43 +0000
Content-Disposition: inline
In-Reply-To: <20181211131706.l23mh6wzzenxixwf@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Minjun Hong <nickeysgo@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDE6MTc6MDZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIERlYyAxMSwgMjAxOCBhdCAwOTo0MDozNVBNICswOTAwLCBNaW5qdW4gSG9uZyB3
cm90ZToKPiA+IEhpLiBXaGlsZSBJIHJldmlldyB0aGUgcmVzdWx0IG9mIG15IHJlc2VhcmNoLCBz
dWRkZW5seSBhIGdvb2QgaWRlYSBjb21lcwo+ID4gdXAsIGFuZCBJIGFtIGxvb2tpbmcgZm9yIGhv
dyB0byBtYWtlIHRocmVhZHMgaW4gWGVuIGxpa2Uga3RocmVhZCBpbiBMaW51eAo+ID4ga2VybmVs
Lgo+ID4gCj4gPiBIb3dldmVyLCBhZnRlciBnb29nbGluZyBhbmQgc2VhcmNoaW5nIGZvciB0aGUg
c291cmNlIGNvZGUgYnkgZ3JlcCwgSSBoYXZlCj4gPiBmb3VuZCBvbmx5IHNvbWUgaW5mb3JtYXRp
b24gcmVnYXJkaW5nIHN0dWIgZG9tYWluIGFuZCBkYWVtb25zLCBzdWNoIGFzCj4gPiB4ZW5jb25z
b2xlZCBhbmQgeGVuYnVzLgo+ID4gCj4gPiBJIHdhbnQgYSBzaW1wbGUgdGhyZWFkIGluIFhlbiB0
byBvZmZsb2FkIHNvbWUgd29ya3Mgd2hpY2ggaXMgYmVpbmcgZXhlY3V0ZWQKPiA+IGluIHRoZSBD
cmVkaXQgc2NoZWR1bGVyLgo+ID4gCj4gPiBJcyB0aGVyZSBhbnkgZGF0YSBzdHJ1Y3R1cmUgb3Ig
QVBJIGZvciB0aGF0IHB1cnBvc2UgaW4gdGhlIFhlbiBzb3VyY2UgY29kZSA/Cj4gCj4gVGhlcmUg
aXMgbm8gY29uY2VwdCBvZiB0aHJlYWRzIGluIFhlbi4gIFlvdSBtYXkgYmUgYWJsZSB0byBvZmZs
b2FkIHdvcmsKPiB0byBhIHNvZnRpcnEuCgpBbmQgdGhlcmUgaXMgYWxzbyB0YXNrbGV0IGluIFhl
bi4gRm9yZ290IHRvIG1lbnRpb24gdGhhdCBpbiBteSBwcmV2aW91cwplbWFpbC4KCldlaS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
