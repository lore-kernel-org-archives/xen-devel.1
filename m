From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 08:20:31 -0600
Message-ID: <5C8A632F020000780021EB58@prv1-mh.provo.novell.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4RDo-0003BL-Cu
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:20:36 +0000
In-Reply-To: <20190314145003.36695ef4.olaf@aepfle.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjUwLCA8b2xhZkBhZXBmbGUuZGU+IHdyb3RlOgo+IEluIHN0
YWdpbmcgdGhlIGNoYW5nZSB3b3VsZCBhZmZlY3QgSFZNIGFuZCBQVkguIEkgbmV2ZXIgcmFuIFBW
SCwKPiBJIGhhdmUgdG8gYXNzdW1lIGl0IGJlaGF2ZXMgbGlrZSBIVk0gaW4gdGhpcyByZWdhcmQu
CgpBbmQgYWdhaW4geW91IG1ha2llIGl0IGxvb2sgYXMgaWYgUFYgd2Fzbid0IGFsc28gZ29pbmcg
dGhyb3VnaCB0aGF0CnNhbWUgcGF0aC4gWWV0IGFsbCB0aGF0J3MgdGhlcmUgYXQgdGhlIHRvcCBv
ZiB0aGUgZnVuY3Rpb24gaXMKCiAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiBpc19oYXJkd2Fy
ZV9kb21haW4oZCkgKQogICAgewogICAgICAgIGQtPmFyY2gudnRzYyA9IDA7CiAgICAgICAgcmV0
dXJuIDA7CiAgICB9CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
