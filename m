From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Fri, 7 Sep 2018 14:03:37 +0200
Message-ID: <20180907120337.GB11834__8855.02293608642$1536321743$gmane$org@soda.linbit>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905162756.GA26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ug0h=lv=linbit.com=lars.ellenberg@srs-us1.protection.inumbo.net>)
 id 1fyFUE-00050T-1A
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 12:03:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id j26-v6so14739907wre.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Sep 2018 05:03:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180905162756.GA26705@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, drbd-user@lists.linbit.com, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMDY6Mjc6NTZQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gT24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMTI6MzY6NDlQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIFdlZCwgQXVnIDI5LCAyMDE4IGF0IDA4OjUyOjE0QU0g
KzAyMDAsIFZhbGVudGluIFZpZGljIHdyb3RlOgo+ID4gPiBTd2l0Y2hpbmcgdG8gY2xvc2VkIHN0
YXRlIGVhcmxpZXIgY2FuIGNhdXNlIHRoZSBibG9jay1kcmJkCj4gPiA+IHNjcmlwdCB0byBmYWls
IHdpdGggJ0RldmljZSBpcyBoZWxkIG9wZW4gYnkgc29tZW9uZSc6Cj4gPiA+IAo+ID4gPiByb290
OiAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrLWRyYmQ6IHJlbW92ZSBYRU5CVVNfUEFUSD1iYWNrZW5k
L3ZiZC82LzUxNzEyCj4gPiA+IGtlcm5lbDogWyAyMjIyLjI3ODIzNV0gYmxvY2sgZHJiZDY6IFN0
YXRlIGNoYW5nZSBmYWlsZWQ6IERldmljZSBpcyBoZWxkIG9wZW4gYnkgc29tZW9uZQo+ID4gPiBr
ZXJuZWw6IFsgMjIyMi4yNzgzMDRdIGJsb2NrIGRyYmQ2OiAgIHN0YXRlID0geyBjczpDb25uZWN0
ZWQgcm86UHJpbWFyeS9TZWNvbmRhcnkgZHM6VXBUb0RhdGUvVXBUb0RhdGUgci0tLS0tIH0KPiA+
ID4ga2VybmVsOiBbIDIyMjIuMjc4MzQwXSBibG9jayBkcmJkNjogIHdhbnRlZCA9IHsgY3M6Q29u
bmVjdGVkIHJvOlNlY29uZGFyeS9TZWNvbmRhcnkgZHM6VXBUb0RhdGUvVXBUb0RhdGUgci0tLS0t
IH0KPiA+ID4gcm9vdDogL2V0Yy94ZW4vc2NyaXB0cy9ibG9jay1kcmJkOiBXcml0aW5nIGJhY2tl
bmQvdmJkLzYvNTE3MTIvaG90cGx1Zy1lcnJvciAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrLWRyYmQg
ZmFpbGVkOyBlcnJvciBkZXRlY3RlZC4gYmFja2VuZC92YmQvNi81MTcxMi9ob3RwbHVnLXN0YXR1
cyBlcnJvciB0byB4ZW5zdG9yZS4KPiA+ID4gcm9vdDogL2V0Yy94ZW4vc2NyaXB0cy9ibG9jay1k
cmJkOiAvZXRjL3hlbi9zY3JpcHRzL2Jsb2NrLWRyYmQgZmFpbGVkOyBlcnJvciBkZXRlY3RlZC4K
ClZlcnkgZnJlcXVlbnRseSBpdCBpcyAqTk9UKiB0aGUgIm9yaWdpbmFsIHVzZXIiLCB0aGF0ICJz
dGlsbCIgaG9sZHMgaXQKb3BlbiwgYnV0IHVkZXYsIG9yIHNvbWV0aGluZyB0cmlnZ2VyZWQtYnkt
dWRldi4KClNvIGRvdWJsZS1jaGVja2luZyB0aGUgdWRldiBydWxlcywKb3IgdGhlICJsdm0gZ2xv
YmFsX2ZpbHRlciIgc2V0dGluZ3MgbWF5IGhlbHAuCllvdSBjb3VsZCBpbnN0cnVtZW50IERSQkQg
dG8gbG9nIGN1cnJlbnQtPntwaWQsY29tbX0gb24gb3BlbiBhbmQgY2xvc2UsCnNvIHlvdSBjYW4g
YmV0dGVyIGRldGVjdCB3aG8gdGhlICJzb21lb25lIiBpcyBpbiB0aGUgbWVzc2FnZSBhYm92ZS4K
CkFkZGluZyBhIHNtYWxsIHJldHJ5IGxvb3AgaW4gdGhlIHNjcmlwdCBtYXkgaGVscCBhcyB3ZWxs
LgoKQXMgYSBzaWRlIG5vdGUsIAp3aXRoIERSQkQgOSAod2hpY2ggc3RpbGwgbW92ZXMgdG9vIGZh
c3QgdG8gYmUgImluIHRyZWUiKQp3ZSBoYXZlIHRoZSAiYXV0by1wcm9tb3RlIiBmZWF0dXJlLCB3
aGVyZSBubyBleHBsaWNpdCBwcm9tb3Rpb24vZGVtb3Rpb24KaXMgbmVjZXNzYXJ5IGFueW1vcmUs
IGJ1dCBEUkJEICh0cmllcyB0bykgcHJvbW90ZSBpdHNlbGYgd2l0aCB0aGUKZmlyc3QgIlJXIiBv
cGVuZXIsIGFuZCBkZW1vdGUgaXRzZWxmIG9uY2UgdGhlIGxhc3Qgb3BlbmVyIGlzIGdvbmUuCgoK
SHRoLAogICAgTGFycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
