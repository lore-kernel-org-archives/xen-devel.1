From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Tue, 15 Jan 2019 11:43:58 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1901151142590.1865__28230.8399714113$1547548964$gmane$org@nanos.tec.linutronix.de>
References: <20190114124413.3742-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jR/D=PX=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1gjMCS-0003mA-0v
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 10:44:04 +0000
In-Reply-To: <20190114124413.3742-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, hans@knorrie.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNCBKYW4gMjAxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gQ29tbWl0IGY5NGM4
ZDExNjk5NzU5ICgic2NoZWQvY2xvY2ssIHg4Ni90c2M6IFJld29yayB0aGUgeDg2ICd1bnN0YWJs
ZScKPiBzY2hlZF9jbG9jaygpIGludGVyZmFjZSIpIGJyb2tlIFhlbiBndWVzdCB0aW1lIGhhbmRs
aW5nIGFjcm9zcwo+IG1pZ3JhdGlvbjoKPiAKPiBbICAxODcuMjQ5OTUxXSBGcmVlemluZyB1c2Vy
IHNwYWNlIHByb2Nlc3NlcyAuLi4gKGVsYXBzZWQgMC4wMDEgc2Vjb25kcykgZG9uZS4KPiBbICAx
ODcuMjUxMTM3XSBPT00ga2lsbGVyIGRpc2FibGVkLgo+IFsgIDE4Ny4yNTExMzddIEZyZWV6aW5n
IHJlbWFpbmluZyBmcmVlemFibGUgdGFza3MgLi4uIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpIGRv
bmUuCj4gWyAgMTg3LjI1MjI5OV0gc3VzcGVuZGluZyB4ZW5zdG9yZS4uLgo+IFsgIDE4Ny4yNjY5
ODddIHhlbjpncmFudF90YWJsZTogR3JhbnQgdGFibGVzIHVzaW5nIHZlcnNpb24gMSBsYXlvdXQK
PiBbMTg0NDY3NDM4MTEuNzA2NDc2XSBPT00ga2lsbGVyIGVuYWJsZWQuCj4gWzE4NDQ2NzQzODEx
LjcwNjQ3OF0gUmVzdGFydGluZyB0YXNrcyAuLi4gZG9uZS4KPiBbMTg0NDY3NDM4MTEuNzIwNTA1
XSBTZXR0aW5nIGNhcGFjaXR5IHRvIDE2Nzc3MjE2CgpJIHNlZSB0aGF0IGl0J3MgYnJva2VuLCBi
dXQgdGhlIGNoYW5nZWxvZyBjb3VsZCBkbyB3aXRoIGFuIGV4cGxhbmF0aW9uIFdIWQppdCBicm9r
ZS4KCk90aGVyIHRoYW4gdGhhdCB0aGlzIGxvb2tzIGFib3V0IHJpZ2h0LgoKVGhhbmtzLAoKCXRn
bHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
