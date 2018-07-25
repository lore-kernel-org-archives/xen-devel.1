From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] tools/helpers: don't hardcode domain
 type for dom0 and xenstore domain
Date: Wed, 25 Jul 2018 15:53:58 +0100
Message-ID: <20180725145358.dmjz7xcjvrssmz4k@citrix.com>
References: <20180725145040.21190-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiLAw-0001t3-Ej
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 14:54:02 +0000
Content-Disposition: inline
In-Reply-To: <20180725145040.21190-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDQ6NTA6NDBQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUb2RheSB3aGVuIHNldHRpbmcgdXAgYSBtaW5pbWFsIGRvbWFpbiBjb25maWd1cmF0
aW9uIGZpbGUgZm9yIGRvbTAgYW5kCj4gZXZlbnR1YWxseSB4ZW5zdG9yZS1kb21haW4gdGhlIGRv
bWFpbiB0eXBlIGlzIGhhcmNvZGVkIGFzIFBWLiBDaGFuZ2UKPiB0aGF0IGJ5IGFza2luZyB0aGUg
aHlwZXJ2aXNvciBmb3IgdGhlIGNvcnJlY3QgdHlwZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
