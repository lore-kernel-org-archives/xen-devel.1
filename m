From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 07/31] libxl_qmp: Learned to send FD
 through QMP to QEMU
Date: Wed, 27 Jun 2018 15:26:51 +0100
Message-ID: <23347.40619.710495.118665@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-8-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYBPL-00052j-PZ
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:26:55 +0000
In-Reply-To: <20180601143720.24637-8-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDA3LzMxXSBsaWJ4bF9xbXA6IExlYXJu
ZWQgdG8gc2VuZCBGRCB0aHJvdWdoIFFNUCB0byBRRU1VIik6Cj4gQWRkaW5nIHRoZSBhYmlsaXR5
IHRvIHNlbmQgYSBmaWxlIGRlc2NyaXB0b3IgZnJvbSBsaWJ4bCB0byBRRU1VIHZpYSB0aGUKPiBR
TVAgaW50ZXJmYWNlLiBUaGlzIHdpbGwgYmUgdXNlIHdpdGggdGhlICJhZGQtZmQiIFFNUCBjb21t
YW5kLgoKRG8geW91IGtub3cgd2hpY2ggYnl0ZSBvZiB0aGUgbWVzc2FnZSB0aGUgZmQgc2hvdWxk
IGJlIGF0dGFjaGVkIHRvID8KCldoYXQgaWYgcWVtdSByZWFkcyBhIHBhcnRpYWwgbWVzc2FnZSwg
ZGlzY2FyZGluZyB0aGUgZmQsIGFuZCB0aGVuCnJlYWRzIHRoZSByZXN0IG9mIHRoZSBtZXNzYWdl
LCBmaW5kaW5nIHRoZSBmZCBtaXNzaW5nID8gIE9yIHNvbWV0aGluZy4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
