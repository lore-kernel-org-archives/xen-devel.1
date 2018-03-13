From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 0/6] x86: Meltdown band-aid overhead reduction
Date: Tue, 13 Mar 2018 07:37:56 -0600
Message-ID: <5AA7E24402000078001B0F41@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c4be=gd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1evk7z-0000hu-SH
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 13:38:07 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

MTogTk9QIG91dCBtb3N0IFhQVEkgZW50cnkvZXhpdCBjb2RlIHdoZW4gaXQncyBub3QgaW4gdXNl
CjI6IGRpc2FibGUgWFBUSSB3aGVuIFJEQ0xfTk8KMzogeDg2OiBsb2cgWFBUSSBlbmFibGVkIHN0
YXR1cwo0OiB1c2UgJXIxMiB0byB3cml0ZSB6ZXJvIGludG8geGVuX2NyMwo1OiByZWR1Y2UgLnRl
eHQuZW50cnkKNjogYXZvaWQgZG91YmxlIENSMyByZWxvYWQgd2hlbiBzd2l0Y2hpbmcgdG8gZ3Vl
c3QgdXNlciBtb2RlCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
