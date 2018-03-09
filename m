From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [BUG] [SOLVED] unable to shutdown (page fault in
 mwait_idle()/do_dbs_timer()/__find_next_bit())
Date: Fri, 09 Mar 2018 01:27:57 -0700
Message-ID: <5AA2539D02000078001B0107@prv-mh.provo.novell.com>
References: <alpine.GSO.2.00.1801071253201.12024@dmz.c-home.cz>
 <5A534F63020000780019C036@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1801081614550.20626@dmz.c-home.cz>
 <5A54FAF7020000780019CD3E@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1801092044510.10972@dmz.c-home.cz>
 <5A982A5402000078001AD6F8@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1803081124510.4381@dmz.c-home.cz>
 <5AA176AD02000078001AFEC3@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1803090822310.11311@dmz.c-home.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ibp0=f7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1euDNl-0007cZ-DB
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 08:28:05 +0000
In-Reply-To: <alpine.GSO.2.00.1803090822310.11311@dmz.c-home.cz>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Martin Cerveny <M.Cerveny@computer.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAzLjE4IGF0IDA4OjMyLCA8bWFydGluQGMtaG9tZS5jej4gd3JvdGU6Cj4gSXQg
c2VlbXMgdG8gYmUgc29sdmVkIGJ5IHlvdXIgcGF0Y2ggIQoKVGhhbmtzIGZvciBjb25maXJtaW5n
OyBJJ2xsIHRha2UgdGhlIGxpYmVydHkgYW5kIGFkZCB5b3VyIFRlc3RlZC1ieQp0aGVuIHRvby4K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
