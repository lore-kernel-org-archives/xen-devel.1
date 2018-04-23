From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [RFC 0/2] To introduce xenwatch multithreading (xen
 mtwatch)
Date: Tue, 24 Apr 2018 07:55:07 +0800
Message-ID: <6c379249-886d-76ee-db9c-942967b23d80__36534.5528153286$1524527523$gmane$org@oracle.com>
References: <1523100355-27647-1-git-send-email-dongli.zhang@oracle.com>
 <20180423140911.bihiwfwtlneobgzd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3fsx=hm=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1fAlGs-0006c2-CY
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 23:53:22 +0000
In-Reply-To: <20180423140911.bihiwfwtlneobgzd@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: jgross@suse.com, ian.jackson@eu.citrix.com, linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Joao Martins <joao.m.martins@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMDQvMjMvMjAxOCAxMDowOSBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBTYXQs
IEFwciAwNywgMjAxOCBhdCAwNzoyNTo1M1BNICswODAwLCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+
IEFib3V0IHBlci1kb21VIHhlbndhdGNoIHRocmVhZCBjcmVhdGUvZGVzdHJveSwgYSBuZXcgdHlw
ZSBvZiB4ZW5zdG9yZSBub2RlIGlzCj4+IGludHJvZHVjZWQ6ICcvbG9jYWwvZG9tYWluLzAvbXR3
YXRjaC88ZG9taWQ+Jy4KPj4KPj4gU3VwcG9zZSB0aGUgbmV3IGRvbWlkIGlkIDcuIER1cmluZyB0
aGUgZG9tVSAoZG9taWQ9NykgY3JlYXRpb24sIHRoZSB4ZW4KPj4gdG9vbHN0YWNrIHdyaXRlcyAn
L2xvY2FsL2RvbWFpbi8wL210d2F0Y2gvNycgdG8geGVuc3RvcmUgYmVmb3JlIHRoZSBpbnNlcnRp
b24KPj4gb2YgJy9sb2NhbC9kb21haW4vNycuIFdoZW4gdGhlIGRvbWlkPTcgaXMgZGVzdHJveWVk
LCB0aGUgbGFzdCB4ZW5zdG9yZQo+PiBvcGVyYXRpb24gYnkgeGVuIHRvb2xzdGFjayBpcyB0byBy
ZW1vdmUgJy9sb2NhbC9kb21haW4vMC9tdHdhdGNoLzcnLgo+Pgo+PiBUaGUgZG9tMCBrZXJuZWwg
c3Vic2NyaWJlcyBhIHdhdGNoIGF0IG5vZGUgJy9sb2NhbC9kb21haW4vMC9tdHdhdGNoJy4gIEtl
cm5lbAo+PiB0aHJlYWQgW3hlbi1tdHdhdGNoLTddIGlzIGNyZWF0ZWQgd2hlbiAnL2xvY2FsL2Rv
bWFpbi8wL210d2F0Y2gvNycgaXMgaW5zZXJ0ZWQsCj4+IHdoaWxlIHRoaXMga2VybmVsIHRocmVh
ZCBpcyBkZXN0cm95ZWQgd2hlbiB0aGUgY29ycmVzcG9uZGluZyB4ZW5zdG9yZSBub2RlIGlzCj4+
IHJlbW92ZWQuCj4gCj4gSW5zdGVhZCBvZiBpbnZlbnRpbmcgeWV0IGFub3RoZXIgbm9kZSwgY2Fu
IHlvdSBub3Qgd2F0Y2ggL2xvY2FsL2RvbWFpbgo+IGRpcmVjdGx5PwoKV291bGQgeW91IGxpa2Ug
dG8gd2F0Y2ggYXQgL2xvY2FsL2RvbWFpbiBkaXJlY3RseT8gT3IgaXMgeW91ciBxdWVzdGlvbiAi
aXMgdGhlcmUKYW55IG90aGVyIHdheSB0byBub3Qgd2F0Y2ggYXQgL2xvY2FsL2RvbWFpbiwgd2hp
bGUgbm8gZXh0cmEgeGVuc3RvcmUgbm9kZSB3aWxsCmJlIGludHJvZHVjZWQiPwoKQWN0dWFsbHks
IHRoZSBmaXJzdCBwcm90b3R5cGUgb2YgdGhpcyBpZGVhIHdhcyB0byB3YXRjaCBhdCAvbG9jYWwv
ZG9tYWluCmRpcmVjdGx5IHRvIGdldCBhd2FyZSBvZiB0aGUgZG9tVSBjcmVhdGUvZGVzdHJveSwg
c28gdGhhdCB4ZW4gdG9vbHN0YWNrIHdpbGwgbm90CmdldCBpbnZvbHZlZC4gSm9hbyBNYXJ0aW5z
IChDQ2VkKSBoYWQgYSBjb25jZXJuIG9uIHRoZSBwZXJmb3JtYW5jZSBhcyB3YXRjaGluZwphdCAv
bG9jYWwvZG9tYWluIHdvdWxkIGxlYWQgdG8gbGFyZ2UgYW1vdW50IG9mIHhlbndhdGNoIGV2ZW50
cy4KCkRvbmdsaSBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
