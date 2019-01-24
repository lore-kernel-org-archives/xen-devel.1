From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86emul: correct AVX512BW write masking
 checks
Date: Thu, 24 Jan 2019 03:54:09 -0700
Message-ID: <5C4999510200007800210C3E@prv1-mh.provo.novell.com>
References: <5C3C7511020000780020D2BF@suse.com>
 <cb65c6cc-7ef6-2ae7-4206-901f8f907d0e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gmceC-0001q9-Tc
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 10:54:12 +0000
In-Reply-To: <cb65c6cc-7ef6-2ae7-4206-901f8f907d0e@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE5IGF0IDEyOjQwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
NC8wMS8yMDE5IDEyOjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRm9yIFZQU0FEQlcgdGhpcyBs
aWtlbHkgd2FzIGEgcmVzdWx0IG9mIGJhZCBjb3B5LWFuZC1wYXN0ZS4KPj4gCj4+IEZvciBWUFN7
TCxSfUxEUSBjb21tZW50IGFuZCBjb2RlIHdlcmUgbm90IGluIGxpbmUsIGJ1dCB0aGVuIGFnYWlu
IHRoZQo+PiBjb21tZW50IGFsc28gd2Fzbid0IGZ1bGx5IHVwZGF0ZWQgZnJvbSB0aGUgQVZYMiBv
cmlnaW5hbCBpdCBnb3QgY2xvbmVkCj4+IGZyb20uCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQW5kcmV3PwoKVGhhbmtzLCBKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
