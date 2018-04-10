From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 7/9] xen/x86: convert
 pv_guest_cr4_to_real_cr4() to a function
Date: Tue, 10 Apr 2018 03:17:30 -0600
Message-ID: <5ACC9D4A02000078001B9D3A@prv1-mh.provo.novell.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-8-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ay0c=g7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5pPC-0005ya-NL
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:17:34 +0000
In-Reply-To: <20180410075843.6822-8-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE4IGF0IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBwdl9n
dWVzdF9jcjRfdG9fcmVhbF9jcjQoKSBpcyBiZWNvbWluZyBtb3JlIGFuZCBtb3JlIGNvbXBsZXgu
IENvbnZlcnQKPiBpdCBmcm9tIGEgbWFjcm8gdG8gYW4gb3JkaW5hcnkgZnVuY3Rpb24uCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
