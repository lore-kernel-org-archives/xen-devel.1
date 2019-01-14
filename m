From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Mon, 14 Jan 2019 08:54:29 -0500
Message-ID: <93146de6-24ec-c914-2d1e-718762f97d65__11265.0340343409$1547474022$gmane$org@oracle.com>
References: <20190114124413.3742-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bjvR=PW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gj2hh-0008It-00
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 13:55:01 +0000
In-Reply-To: <20190114124413.3742-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, hans@knorrie.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNC8xOSA3OjQ0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IENvbW1pdCBmOTRjOGQx
MTY5OTc1OSAoInNjaGVkL2Nsb2NrLCB4ODYvdHNjOiBSZXdvcmsgdGhlIHg4NiAndW5zdGFibGUn
Cj4gc2NoZWRfY2xvY2soKSBpbnRlcmZhY2UiKSBicm9rZSBYZW4gZ3Vlc3QgdGltZSBoYW5kbGlu
ZyBhY3Jvc3MKPiBtaWdyYXRpb246Cj4KPiBbICAxODcuMjQ5OTUxXSBGcmVlemluZyB1c2VyIHNw
YWNlIHByb2Nlc3NlcyAuLi4gKGVsYXBzZWQgMC4wMDEgc2Vjb25kcykgZG9uZS4KPiBbICAxODcu
MjUxMTM3XSBPT00ga2lsbGVyIGRpc2FibGVkLgo+IFsgIDE4Ny4yNTExMzddIEZyZWV6aW5nIHJl
bWFpbmluZyBmcmVlemFibGUgdGFza3MgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpIGRvbmUu
Cj4gWyAgMTg3LjI1MjI5OV0gc3VzcGVuZGluZyB4ZW5zdG9yZS4uLgo+IFsgIDE4Ny4yNjY5ODdd
IHhlbjpncmFudF90YWJsZTogR3JhbnQgdGFibGVzIHVzaW5nIHZlcnNpb24gMSBsYXlvdXQKPiBb
MTg0NDY3NDM4MTEuNzA2NDc2XSBPT00ga2lsbGVyIGVuYWJsZWQuCj4gWzE4NDQ2NzQzODExLjcw
NjQ3OF0gUmVzdGFydGluZyB0YXNrcyAuLi4gZG9uZS4KPiBbMTg0NDY3NDM4MTEuNzIwNTA1XSBT
ZXR0aW5nIGNhcGFjaXR5IHRvIDE2Nzc3MjE2Cj4KPiBGaXggdGhhdCBieSBzZXR0aW5nIHhlbl9z
Y2hlZF9jbG9ja19vZmZzZXQgYXQgcmVzdW1lIHRpbWUgdG8gZW5zdXJlIGEKPiBtb25vdG9uaWMg
Y2xvY2sgdmFsdWUuCj4KPiBGaXhlczogZjk0YzhkMTE2OTk3NTkgKCJzY2hlZC9jbG9jaywgeDg2
L3RzYzogUmV3b3JrIHRoZSB4ODYgJ3Vuc3RhYmxlJyBzY2hlZF9jbG9jaygpIGludGVyZmFjZSIp
Cj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDQuMTEKPiBSZXBvcnRlZC1ieTogSGFu
cyB2YW4gS3JhbmVuYnVyZyA8aGFuc0Brbm9ycmllLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
