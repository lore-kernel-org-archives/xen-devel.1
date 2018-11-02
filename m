From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition [and 1
 more messages] [and 2 more messages] [and 2 more messages]
Date: Fri, 2 Nov 2018 16:44:43 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1811021221070.18518@sstabellini-ThinkPad-X260>
References: <CAFLBxZYyKbw3L0p+a9FbLiHy3icSOTPG+Dndk+L1eZjnxaufaA@mail.gmail.com>
 <alpine.DEB.2.10.1810311138360.7220@sstabellini-ThinkPad-X260>
 <CAFLBxZZtiPxCw8Pz4+3JN81ENjzms+qnQEhHBcbJs9FxEP_QXA@mail.gmail.com>
 <18bf9618-d950-8cfa-1746-e330f3ce0e66@arm.com>
 <alpine.DEB.2.10.1810301528180.22840@sstabellini-ThinkPad-X260>
 <23513.52378.653350.705575@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1810310942530.7220@sstabellini-ThinkPad-X260>
 <23514.62634.413212.853593@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1811011051290.7220@sstabellini-ThinkPad-X260>
 <5F35FB3B-9C4F-467C-8461-5201D0BF5E18@citrix.com>
 <20181102141632.jr4vjefvou5562zd@zion.uk.xensource.com>
 <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <CAFLBxZabx3rG1t8C+6p-+kojxq1WNOqEXn23GyB+w0OgjDYLiQ@mail.gmail.com>
 <23516.26572.806824.551458@mariner.uk.xensource.com>
 <alpine.DEB.2.10.1811021048170.18518@sstabellini-ThinkPad-X260>
 <25ada98c-bd5a-83c2-134a-171293f7f638@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=boe/=nn=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gIj7O-0006Gn-M4
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 23:44:46 +0000
In-Reply-To: <25ada98c-bd5a-83c2-134a-171293f7f638@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, stefanos@xilinx.com, George Dunlap <dunlapg@umich.edu>, cardoe@cardoe.com, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, infra@xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyIE5vdiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMDIvMTEvMjAxOCAx
Nzo1NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gRnJpLCAyIE5vdiAyMDE4LCBJ
YW4gSmFja3NvbiB3cm90ZToKPiA+ID4gSWUgdGhlIGJpZ2dlc3Qgd29yayBoZXJlIG9mIGFsbCBr
aW5kcyBpcyBpcyBnbHVlLiAgQWRkaW5nIG1vcmUKPiA+ID4gZW50aXRpZXMgdG8gdGhlIHByb2Js
ZW0gd2lsbCBpbmNyZWFzZSByYXRoZXIgdGhhbiByZWR1Y2UgdGhlIGFtb3VudCBvZgo+ID4gPiBn
bHVlIGNvZGUgdGhhdCBuZWVkcyB0byBiZSB3cml0dGVuLgo+ID4gCj4gPiBCYXNpY2FsbHksIHlv
dSBhcmUgc2F5aW5nIHRoYXQgZXZlbiBpZiBoYWQgYSB3ZWxsIG1haW50YWluZWQgZGViCj4gPiBy
ZXBvc2l0b3J5IG9mIGtlcm5lbCBwYWNrYWdlcyBmb3IgT1NTVGVzdCB0byB1c2UsIGRvZXNuJ3Qg
bWF0dGVyIGhvdyB3ZQo+ID4gYWNoaWV2ZSB0aGlzIGdvYWwsIGl0IHdvdWxkIHN0aWxsIHJlcXVp
cmUgYSBub24gdHJpdmlhbCBhbW91bnQgb2Ygd29yawo+ID4gdG8gZG8gdGhlIGludGVncmF0aW9u
IHdpdGggT1NTVGVzdC4KPiAKPiBUaGlzIGlzIG5vdCBob3cgSSB1bmRlcnN0b29kIHRoZSB0aHJl
YWQuIEkgYmVsaWV2ZSB0aGlzIHdhcyByZWxhdGVkIHRvIHVzZSBhbgo+IGV4dGVybmFsIENJIGxv
b3AuCj4gCj4gSW4gb3VyIGNhc2UsIG9uY2Ugd2UgaGF2ZSBhIGRlYiBwYWNrYWdlLiBUaGVuIHRo
aXMgaXMgbm90IG11Y2ggZGlmZmVyZW50IHRoYW4KPiB1c2luZyBhIGJhY2twb3J0IGtlcm5lbC4g
V2UgYWxyZWFkeSBoYXZlIHN1Y2ggc3VwcG9ydCBpbiBPc3N0ZXN0LCBzbyBpdCBzaG91bGQKPiBu
b3QgYmUgdG9vIGRpZmZpY3VsdCB0byBhZGFwdCBpdCBmb3IgYSBkaWZmZXJlbnQgcmVwby4KCk9L
LCBJIG1pc3VuZGVyc3Rvb2QgSWFuLCB0aGFua3MgZm9yIHN0ZXBwaW5nIGluLiBJZiB0aGF0IGlz
IHRoZSBjYXNlLCB0aGVuOgoKMSkgV2UgYWxyZWFkeSBoYXZlIGEgWGVuIEFSTSBMaW51eCB0cmVl
IHdoaWNoIHdlIGhhdmUgdG8gbWFpbnRhaW4gZm9yIERvbTAKVGhlIG1haW50ZW5hbmNlIG1vZGVs
IGFuZCB0ZXN0aW5nIG9mIHRoaXMgdHJlZSBkb2Vzbid0IGNoYW5nZSByZWdhcmRsZXNzLgoKMikg
V2UgYWxyZWFkeSBoYXZlIERvY2tlcmZpbGVzIGFuZCBzY3JpcHRzIGJ5IERvdWcgYW5kIFZpcnlh
T1MgdG8gYnVpbGQga2VybmVscyBvbiBnaXRsYWIKV2UgY291bGQgaW1wcm92ZSB0aGVtIHRvIGJ1
aWxkIGEgZnVsbCBkZWIgcmVwb3NpdG9yeS4KCldoYXQncyBzdG9wcGluZyB1cyBmcm9tIHVzaW5n
ICgyKSB0byBzZXR1cCB1cCBhIFhlbiBQcm9qZWN0IGRlYiByZXBvPwoKRG9lcyBpdCByZWFsbHkg
bWF0dGVyIHdobyBleGVjdXRlcyBzY3JpcHRzICgyKSBhbmQgd2hldGhlciB0aGV5IGFyZSBydW4K
b24geW91ciBsYXB0b3Agb3IgaW4gdGhlIGNsb3VkIGFzIGxvbmcgYXMgdGhlIGJ1aWxkIGlzIGZ1
bGx5CnJlcHJvZHVjaWJsZT8gV2UgYXJlIG5vdCB0YWxraW5nIGFib3V0IGhhY2tpbmcgY29uZmln
IGZpbGVzIGFyb3VuZCBhbmQKdXNpbmcgd2hvIGtub3dzIHdoYXQgY29tcGlsZXIgdG8gYnVpbGQg
c29tZXRoaW5nLiBkb2NrZXIgYnVpbGQgd2lsbCBnaXZlCnlvdSB0aGUgc2FtZSBvdXRwdXQgbm8g
bWF0dGVyIHRoZSBob3N0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
