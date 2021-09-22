Return-Path: <SRS0=cgBe=OM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4D1C433EF
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 21:05:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE0A611C4
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 21:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDE0A611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.193061.343878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9QU-0001BD-Ut; Wed, 22 Sep 2021 21:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193061.343878; Wed, 22 Sep 2021 21:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9QU-0001B6-Rj; Wed, 22 Sep 2021 21:05:10 +0000
Received: by outflank-mailman (input) for mailman id 193061;
 Wed, 22 Sep 2021 21:05:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mT9QU-0001Az-E4
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:05:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7622092f-875d-4caa-ba0d-1549d45aee0a;
 Wed, 22 Sep 2021 21:05:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 652A36112F;
 Wed, 22 Sep 2021 21:05:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7622092f-875d-4caa-ba0d-1549d45aee0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632344708;
	bh=CLlsYr/xMME+lA6Uj07qC22IdfSkZ/DckOstv95Y8GM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R5ccNQ/UMqrSzun10aanrfvZeMsRNKRNVuR/RXiilnHZs/geRf5x+ywmtGfmRoy8X
	 CPpqR8UQuDkHboLC5FoBXSzJdJGg2tXC+b4Kg4j8UbneG2FogRfq5zckfzwpCNTsuA
	 DdY/sci08TA1dV0HSv4vs2JVSu0x4uqy12IRBRIc7EG9J/U/kyABE3CwiTPfv6eZ1R
	 Ar4GKx07aQrY+LcrvhVbF52Vdb6iPPqDDct9cc6pikSoxGG2U4Amw/vubBq7DommjL
	 tlGcs3KZMRGwK+I/jgLQK3H8JCT2Ct6hV5Z5MdRHkdFsfrE26IrD+VvVQu4BkPXpgG
	 YiE/96eCiOaWQ==
Date: Wed, 22 Sep 2021 14:05:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for
 Dom0
In-Reply-To: <a3f5707b-b161-1c94-ebe1-d6b8bbe11081@gmail.com>
Message-ID: <alpine.DEB.2.21.2109221402420.17979@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-3-git-send-email-olekstysh@gmail.com> <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org> <08294c53-109a-8544-3a23-85e034d2992d@gmail.com> <alpine.DEB.2.21.2109171451230.21985@sstabellini-ThinkPad-T480s>
 <a993466f-1b7d-ceb3-aa3b-16f5f145b2fb@gmail.com> <a3f5707b-b161-1c94-ebe1-d6b8bbe11081@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1843995332-1632344708=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1843995332-1632344708=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Sep 2021, Oleksandr wrote:
> > > > > You will also need to cover "ranges" that will describe the BARs for
> > > > > the PCI
> > > > > devices.
> > > > Good point.
> > > Yes, very good point!
> > > 
> > > 
> > > > Could you please clarify how to recognize whether it is a PCI
> > > > device as long as PCI support is not merged? Or just to find any device
> > > > nodes
> > > > with non-empty "ranges" property
> > > > and retrieve addresses?
> > > Normally any bus can have a ranges property with the aperture and
> > > possible address translations, including /amba (compatible =
> > > "simple-bus"). However, in these cases dt_device_get_address already
> > > takes care of it, see xen/common/device_tree.c:dt_device_get_address.
> > > 
> > > The PCI bus is special for 2 reasons:
> > > - the ranges property has a different format
> > > - the bus is hot-pluggable
> > > 
> > > So I think the only one that we need to treat specially is PCI.
> > > 
> > > As far as I am aware PCI is the only bus (or maybe just the only bus
> > > that we support?) where ranges means the aperture.
> > Thank you for the clarification. I need to find device node with non-empty
> > ranges property
> > (and make sure that device_type property is "pci"), after that I need to
> > read the context of ranges property and translate it.
> > 
> > 
> 
> OK, I experimented with that and managed to parse ranges property for PCI host
> bridge node.
> 
> I tested on my setup where the host device tree contains two PCI host bridge
> nodes with the following:
> 
> pcie@fe000000 {
> ...
>             ranges = <0x1000000 0x0 0x0 0x0 0xfe100000 0x0 0x100000 0x2000000
> 0x0 0xfe200000 0x0 0xfe200000 0x0 0x200000 0x2000000 0x0 0x30000000 0x0
> 0x30000000 0x0 0x8000000 0x42000000 0x0 0x38000000 0x0 0x38000000 0x0
> 0x8000000>;
> ...
> };
> 
> pcie@ee800000 {
> ...
>             ranges = <0x1000000 0x0 0x0 0x0 0xee900000 0x0 0x100000 0x2000000
> 0x0 0xeea00000 0x0 0xeea00000 0x0 0x200000 0x2000000 0x0 0xc0000000 0x0
> 0xc0000000 0x0 0x8000000 0x42000000 0x0 0xc8000000 0x0 0xc8000000 0x0
> 0x8000000>;
> ...
> };
> 
> So Xen retrieves the *CPU addresses* from the ranges:
> 
> (XEN) dev /soc/pcie@fe000000 range_size 7 nr_ranges 4
> (XEN) 0: addr=fe100000, size=100000
> (XEN) 1: addr=fe200000, size=200000
> (XEN) 2: addr=30000000, size=8000000
> (XEN) 3: addr=38000000, size=8000000
> (XEN) dev /soc/pcie@ee800000 range_size 7 nr_ranges 4
> (XEN) 0: addr=ee900000, size=100000
> (XEN) 1: addr=eea00000, size=200000
> (XEN) 2: addr=c0000000, size=8000000
> (XEN) 3: addr=c8000000, size=8000000
> 
> The code below covers ranges property in the context of finding memory holes
> (to be squashed with current patch):
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d37156a..7d20c10 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -834,6 +834,8 @@ static int __init find_memory_holes(struct meminfo
> *ext_regions)
>      {
>          unsigned int naddr;
>          u64 addr, size;
> +        const __be32 *ranges;
> +        u32 len;
> 
>          naddr = dt_number_of_address(np);
> 
> @@ -857,6 +859,41 @@ static int __init find_memory_holes(struct meminfo
> *ext_regions)
>                  goto out;
>              }
>          }
> +
> +        /*
> +         * Also looking for non-empty ranges property which would likely mean
> +         * that we deal with PCI host bridge device and the property here
> +         * describes the BARs for the PCI devices.
> +         */

One thing to be careful is that ranges with a valid parameter is not
only present in PCI busses. It can be present in amba and other
simple-busses too. In that case the format for ranges in simpler as it
doesn't have a "memory type" like PCI.

When you get addresses from reg, bus ranges properties are automatically
handled for you.

All of this to say that a check on "ranges" is not enough because it
might capture other non-PCI busses that have a different, simpler,
ranges format. You want to check for "ranges" under a device_type =
"pci"; node.


> +        ranges = dt_get_property(np, "ranges", &len);
> +        if ( ranges && len )
> +        {
> +            unsigned int range_size, nr_ranges;
> +            int na, ns, pna;
> +
> +            pna = dt_n_addr_cells(np);
> +            na = dt_child_n_addr_cells(np);
> +            ns = dt_child_n_size_cells(np);
> +            range_size = pna + na + ns;
> +            nr_ranges = len / sizeof(__be32) / range_size;
> +
> +            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
> +            {
> +                /* Skip the child address and get the parent (CPU) address */
> +                addr = dt_read_number(ranges + na, pna);
> +                size = dt_read_number(ranges + na + pna, ns);
> +
> +                start = addr & PAGE_MASK;
> +                end = PAGE_ALIGN(addr + size);
> +                res = rangeset_remove_range(mem_holes, start, end - 1);
> +                if ( res )
> +                {
> +                    printk(XENLOG_ERR "Failed to remove:
> %#"PRIx64"->%#"PRIx64"\n",
> +                           start, end);
> +                    goto out;
> +                }
> +            }
> +        }
>      }

--8323329-1843995332-1632344708=:17979--

